$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../','lib'))

require 'rubygems'
require 'selenium-cucumber'
require 'require_all'
require 'fire_poll'
require 'page-object'
require 'page-object/elements'
require 'page-object/page_factory'
require 'active_support/all'
require 'selenium-webdriver'
require 'nokogiri'
require 'pry'
require 'httparty'
require 'watir-scroll'
require 'sidekiq'
require_all 'lib'

# Store command line arguments
ENV['FRAMEWORK'] = File.expand_path('.')
$platform = ENV['PLATFORM'] || 'desktop'
$os_version = ENV['OS_VERSION']
$device_name = ENV['DEVICE_NAME']
$udid = ENV['UDID']
$app_path = ENV['APP_PATH']

# If platform is android or ios create driver instance for mobile browser
if $platform == 'android'
    if (!$device_name.to_s.empty?)
      AppiumAndroid::AndroidEnvironment.get_proper_app($device_name)
      AppiumAndroid::Android.android_setup($device_name)
    else
      puts "Automation test against real connected device."
    end
    $device_name, $os_version = get_device_info
    # puts "--------------------------"
    # puts "desired_caps:"
    # puts "platform: #{$platform}"
    # puts "os_version: #{$os_version}"
    # puts "device_name: #{$device_name}"
    # puts "udid: #{$udid}"
    # puts "app_path: #{$app_path}"
    # puts "--------------------------"
  desired_caps = {
    caps:       {
      platformName:  $platform,
      versionNumber: $os_version,
      deviceName: $device_name,
      udid: $udid,
      app: ".//#{$app_path}"
      },
    }
  begin
    AppiumAndroid::AppiumHelper.appium_start
    $driver = Appium::Driver.new(desired_caps, true).start_driver
  rescue Exception => e
    puts e.message
    Process.exit(0)
  end
elsif ENV['BROWSER'].eql? 'firefox'# For android emulator device
  puts "Nothing to do"
end
