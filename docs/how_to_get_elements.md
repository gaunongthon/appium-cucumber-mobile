Mobile automation - How to get elements

Step to debug and get element ids:

Pre-condition:
apps/appium.txt has info looks like
[caps]
platformName = 'android'
deviceName = 'GalaxyNexus19'
app = 'apps/GalaxyNexus19/Calculator.apk'
url = 'http://127.0.0.1:4723/wd/hub'

appium.txt file will decide what environment will be used (avd_name) as well as what apk (android application) will be loaded on that environment

Step 1: Check existing emulator
Listing out all Android virtual devices
simple: [emulator -list-avds]
complex: [android list avd]
more complet: [avdmanager list avd]

Step2: Start an emulator
Starting a virtual device which has name as ‘deviceName’ in appium.txt
[emulator -avd GalaxyNexus19]

Step3: Start automation test server for android device appium
Make sure appium servers running.It will be used for ARC connects to for making queries and testing commands
Based on appium.txt, appium will be started at port 4723
lsof -i tcp:4723
kill -9 <id>
Starting by: [appium]

Step 4: Run apk on emulator for Pry
Starting Appium Ruby Console
arc

Step 5: Start to find element and interact with elements
Command line to get/find elements
(appium ruby console
https://github.com/appium/ruby_lib/blob/master/docs/android_docs.md
https://github.com/appium/ruby_console)
For examples:
[page] Prints the content descriptions and text values on the current page. Identifying all elements

Get all elements and pick the last element from array
ele = find_elements(:class, 'ImageView').last

Get a checkbox
e = find_element(:id, 'com.app.calculator:id/driver_terms_and_conditions_check_box')

Click checkbox
e.click

Check if checkbox is checked or not
e.attribute('checked')
