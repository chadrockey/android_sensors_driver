#!/bin/bash

# from http://vardhan-justlikethat.blogspot.co.il/2012/05/android-solution-install-parse-failed.html
PREFIX=~/prefix/
PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR=`basename $PROJECT_PATH`
BIN_DIR=$PREFIX/rosjava/devel/share/maven/org/ros/android_core/$PROJECT_DIR/0.2.0/
APK="$PROJECT_DIR-0.2.0.apk"
KEY=${PROJECT_PATH}/keys/${1}.jks
ALIAS="org.ros.android.$PROJECT_DIR"

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

cd $PREFIX/rosjava
catkin_make

if [ $? -eq 0 ]
 then
  adb uninstall $ALIAS
  jarsigner -verbose -keystore $KEY ${BIN_DIR}${APK} $ALIAS
  echo "Installing the APK, please enter the password of your key,"
  echo "If you don't know, just delete the keys/key.jks,"
  echo "and it will create a new one."
  adb install ${BIN_DIR}${APK}
  adb shell am start -n $ALIAS/$ALIAS.MainActivity
  #adb logcat -c
  #adb logcat
fi

