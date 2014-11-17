#!/bin/bash

# from http://vardhan-justlikethat.blogspot.co.il/2012/05/android-solution-install-parse-failed.html

BIN_DIR=~/rosjava/devel/share/maven/org/ros/android_core/android_sensors_driver/0.2.0/
SENSOR_DIR=~/rosjava/src/android_core/android_sensors_driver/
APK="android_sensors_driver-0.2.0.apk"
KEY=${SENSOR_DIR}keys/${1}.jks
ALIAS="org.ros.android.android_sensor_driver"

if [ -z "$1" ]; then
    echo "Please enter your key name."
    echo "example: key in key/tal.jks, enter ./buildAll.sh tal"
    echo "if you don't have a key, please type ./createKey.sh [your key name]"
    exit
fi

if [ ! -f ${KEY} ]; then 
    echo "file not exsist:"    
    echo ${KEY}
    exit
fi

cd ~/rosjava
catkin_make

if [ $? -eq 0 ]
 then
  adb uninstall $ALIAS
  jarsigner -verbose -keystore $KEY ${BIN_DIR}${APK} $ALIAS
  adb install ${BIN_DIR}${APK}
  #adb shell am start -n org.ros.android.android_sensors_driver/org.ros.android.android_sensors_driver.MainActivity
  #adb logcat -c
  #adb logcat
fi

