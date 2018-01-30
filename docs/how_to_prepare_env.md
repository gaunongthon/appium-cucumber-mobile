1. ruby, gem,nokogiri installation, bundler, brew (ruby devkit)
link: http://railsapps.github.io/installrubyonrails-mac.html

2. other useful links:
https://seleniumcucumber.info/android/
https://appium.io/slate/en/tutorial/android.html?ruby#bash-profile13

3. troubleshooting emulator:
https://code.google.com/p/android/issues/detail?id=235461

4. Check .bash_profile (cat .bash_profile) 
.bash_profile looks like this:
export PATH=/Users/michaelho/.rvm/gems/ruby-2.3.1/bin:/Users/michaelho/.rvm/gem$
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK=$ANDROID_HOME
export APPLICATIONS=/Applications
export SIMULATOR=$APPLICATIONS/Xcode.app/Contents/Developer/Applications/Simula$
PATH=$PATH:$APPLICATIONS/Xcode.app/Contents/Developer/Applications/Simulator.ap$
PATH=$PATH:$ANDROID_HOME/build-tools/25.0.2
PATH=$PATH:$ANDROID_HOME/platform-tools
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/tools/bin
