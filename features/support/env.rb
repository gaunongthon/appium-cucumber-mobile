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
require_all 'lib'

# Store command line arguments
$platform = ENV['PLATFORM'] || 'desktop'
$os_version = ENV['OS_VERSION']
$device_name = ENV['DEVICE_NAME']
$udid = ENV['UDID']
$app_path = ENV['APP_PATH']
$emulator = ENV['android_device'] || ''
# puts "\n platform: #{$platform}"
# puts "\n os_version: #{$os_version}"
# puts "\n device_name: #{$device_name}"
# puts "\n udid: #{$udid}"
# puts "\n app_path: #{$app_path}"
# puts "\n emulator: #{$emulator}"
# puts "\n --------------------------"

# If platform is android or ios create driver instance for mobile browser
if $platform == 'android'
  $device_name, $os_version = get_device_info
  # puts "\n platform: #{$platform}"
  # puts "\n os_version: #{$os_version}"
  # puts "\n device_name: #{$device_name}"
  # puts "\n udid: #{$udid}"
  # puts "\n app_path: #{$app_path}"
  # puts "\n --------------------------"
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
    $driver = Appium::Driver.new(desired_caps, true).start_driver
  rescue Exception => e
    puts e.message
    Process.exit(0)
  end
elsif ENV['BROWSER'].eql? 'firefox'# For android emulator device
  puts "Nothing to do"
end
