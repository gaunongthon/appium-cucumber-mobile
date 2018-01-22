module AppiumAndroid

  class HardWorker
    require 'sidekiq'
    include Sidekiq::Worker

    def perform_async(command)
       command
    end
  end

  class AppiumHelper

    def self.appium_start
      puts 'Starting Appium... please wait... '
      force_kill_appium
      HardWorker.new.perform_async(`appium > ./appium_logs.txt 2>&1&`)
      sleep(10)
      puts "Starting Appium done"
    end

    def self.appium_teardown(driver)
      driver.quit
      force_kill_appium
    end

    def AppiumHelper.force_kill_appium
      if `ps -A | grep -m1 appium | awk '{print $1}'`
        system "kill -9 `ps -A | grep -m1 appium | awk '{print $1}'`"
      end
    end

  end

  class Android

    def self.android_setup(device="GalaxyNexus19")
      puts 'Starting Android emulator... please wait... '
      kill_android
      HardWorker.new.perform_async(`emulator -avd '#{device}' > ./emulator_logs.txt 2>&1&`)
      sleep(10)
      FirePoll.poll("waited too long", 80) do
        emulator_on = `adb shell getprop init.svc.bootanim`.strip
        #puts "Android.android_setup.emulator_on: #{emulator_on}"
        if (emulator_on.to_s.eql? 'stopped')
          true
        end
      end
      puts "Starting Android emulator done"
    end

    def self.android_teardown
      kill_android
    end

    def self.android_device_info
      IO.popen('adb shell getprop ro.product.brand') { |f| $device = f.gets.chomp.upcase}
      $device += ' '
      IO.popen('adb shell getprop ro.product.model') { |f| $device += f.gets.chomp.upcase}
      IO.popen('adb shell getprop ro.build.version.release') { |f| $os_version = f.gets.chomp.upcase}
      return $device, $os_version
    end

    def Android.kill_android
      emulator_on = `adb shell getprop init.svc.bootanim`.strip
      #puts "Android.kill_android.emulator_on: #{emulator_on}"
      if (emulator_on.to_s.eql? 'stopped')
        puts "I'm here to kill running android app left over"
        `adb -e emu kill`
        #puts "... killed"
      end
    end
  end

  class AndroidEnvironment

    def self.get_proper_app(name)
      AppiumAndroid::AndroidValidation.new(name)
      base_path = ENV['FRAMEWORK']
      puts Dir["#{base_path}/apps/#{name}/*.apk"].join(",")
      ENV['APP_PATH'] = Dir["#{base_path}/apps/#{name}/*.apk"].join(",")
    end
  end

  class AndroidValidation
    def initialize(name)
      device_list = `android list avd --compact`.split
      if !device_list.include? name
        print_device_error(name, device_list)
      end
    end

    def print_device_error(name, device_list)
      puts "It looks like #{name} is not a valid device."
      puts "Please choose a valid Android device :"
      puts "You can Copy & Paste the device you'd like to run:"
      puts "\n"
      puts device_list
      Process.exit(0)
    end

  end

end
