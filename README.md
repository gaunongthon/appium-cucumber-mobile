# README #

### What is this? ###

This repository is used for automated smoke test and functional test of mobile application.

### How do I get set up? ###

See details in docs/how_to_prepare_env.md

Create virtual env for installing all dependencies

Install rvm

`sudo apt-get install rvm`

Install ruby

`rvm install ruby --default`

Check ruby version

`ruby --version`

Create a gemset (Where virtualenv has “environments”, RVM has “gemsets”)
```
rvm use 2.3.1
rvm gemset create selenium_mobile
rvm gemset use selenium_mobile
```

Install dependencies
```
gem install bundler
bundle install
```

Only run these commands to clean up your gemset (virtual environment for ruby)
```
rvm gemset empty selenium_mobile
rvm gemset delete selenium_mobile
```
### How to get elements on app?

Start Appium
`appium`

Start Emulator (Using Android SDK to create emulator)
`emulator -avd Emulator_Name`

Start Appium Ruby Console
`arc`

See details in docs/how_to_get_elements.md

### How do I execute test? ###

Run test on emulator
`cucumber -p android_emu`

Run test on real device
`cucumber -p android_real`

### How do I view test report? ###
```
google-chrome reports/results.html
```
