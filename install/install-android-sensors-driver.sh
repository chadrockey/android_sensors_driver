#!/bin/bash

PREFIX=~/prefix
# clone android_core , android_extras
cd ${PREFIX}/rosjava/src
git clone -b indigo https://github.com/rosjava/android_core.git
git clone -b indigo https://github.com/rosjava/android_extras.git

cd android_core
echo "include \"android_sensors_driver\"">> settings.gradle

#clone android_sensor_driver
git clone https://github.com/talregev/android_sensors_driver.git

cd ${PREFIX}/rosjava
catkin_make
