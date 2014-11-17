#!/bin/bash

# from http://vardhan-justlikethat.blogspot.co.il/2012/05/android-solution-install-parse-failed.html

BIN_DIR=~/rosjava/devel/share/maven/org/ros/android_core/android_sensors_driver/0.2.0/
SENSOR_DIR=~/rosjava/src/android_core/android_sensors_driver/
APK="android_sensors_driver-0.2.0.apk"
KEY=${SENSOR_DIR}keys/${1}.jks
ALIAS="org.ros.android.android_sensor_driver"


if [ -z "$1" ]; then
    echo "Please enter your key name."
    echo "example: ./buildAll.sh tal will create keys/tal.jks" 
    exit
fi

keytool -genkey -v -keystore ${KEY} -alias ${ALIAS} -keyalg RSA -keysize 2048 -validity 20000
