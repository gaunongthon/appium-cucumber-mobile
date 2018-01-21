# README #

### What is this? ###

This repository is used for automated smoke test and functional test of web application.

* Based on: selenium-ruby-cucumber - web application BDD test

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
rvm gemset create selenium_ui_test
rvm gemset use selenium_ui_test
```

Install dependencies
```
gem install bundler
bundle install
```

Only run these commands to clean up your gemset (virtual environment for ruby)
```
rvm gemset empty selenium_ui_test
rvm gemset delete selenium_ui_test
```

### How do I execute test? ###

Start Appium
`appium`

Start Emulator
`emulator -avd GalaxyNexus19`

Run test
`cucumber -p android_emu`


### More options to run test cases ###

only run @wip on default env against default browser

`cucumber -p wip -p ff`

run feature_name.feature on default env against default browser but not features with @skip

`cucumber -p headless features/feature_name.feature`

run feature_name.feature on default env against ff browser but not features with @skip

`cucumber features/feature_name.feature -p ff`

### How do I view test report? ###
```
google-chrome reports/results.html
```
