#!/bin/bash

#from https://developer.android.com/sdk/installing/index.html?pkg=tools
#install sdk 
APP_DIR=~/Android
Sdk_Name="Sdk"
cd ~/Downloads
wget -O android-sdk.tgz 'https://dl.google.com/android/android-sdk_r23.0.2-linux.tgz'
mkdir -p ${APP_DIR}
tar -xvzf android-sdk.tgz -C ${APP_DIR}
rm -rf ${APP_DIR}/$Sdk_Name/
cd ${APP_DIR}
mv android-sdk-linux/ $Sdk_Name/
rm -f ~/Downloads/android-sdk.tgz

#Add android-studio and sdk to your PATH
echo "export PATH=\$PATH:${APP_DIR}/$Sdk_Name/tools:${APP_DIR}/$Sdk_Name/platform-tools:/opt/android-studio/bin">> ~/.bashrc
echo "export ANDROID_HOME=${APP_DIR}/$Sdk_Name">> ~/.bashrc

export PATH=$PATH:${APP_DIR}/$Sdk_Name/tools:${APP_DIR}/$Sdk_Name/platform-tools:/opt/android-studio/bin
export ANDROID_HOME=${APP_DIR}/$Sdk_Name

#from http://stackoverflow.com/questions/17963508/how-to-install-android-sdk-build-tools-on-the-command-line
#add package to android sdk
echo yes | android update sdk -u -a -t 1,2,3,9,16,25,27,30,109,110,116

#   android sdk number. 
#   TODO the number will change in the future, and need to update by name.
#   to see this list, type: 
#     android list sdk --all
:' 
   1- Android SDK Tools, revision 23.0.5
   2- Android SDK Platform-tools, revision 21
   3- Android SDK Build-tools, revision 21.1.1
   9- Android SDK Build-tools, revision 19.1
  16- Android SDK Build-tools, revision 18.0.1
  25- SDK Platform Android 4.0.3, API 15, revision 5
  27- SDK Platform Android 3.2, API 13, revision 1
  30- SDK Platform Android 2.3.3, API 10, revision 2
 109- Android Support Repository, revision 9
 110- Android Support Library, revision 21.0.2
 116- Google Repository, revision 13
'
