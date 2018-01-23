check running PID android app
netstat -tulpn|grep 555

check running PID appium
netstat -ntlp|grep 4723

#!/bin/bash
for ((PORT=5554; PORT<=5584; PORT+=2)); do
    echo killing emulator-$PORT...
    adb -s emulator-$PORT emu kill
done
