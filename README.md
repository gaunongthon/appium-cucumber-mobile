# README #

### What is this? ###

This repository is used for automated smoke test and functional test of mobile application.

### How do I get set up? ###

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

### How do I execute test? ###

Start Appium
`appium`

Start Emulator
`emulator -avd GalaxyNexus19`

Run test
`cucumber -p android_emu`

### How do I view test report? ###
```
google-chrome reports/results.html
```
