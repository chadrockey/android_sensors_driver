#!/bin/bash

#from https://developer.android.com/sdk/installing/index.html?pkg=tools
#install sdk 
cd ~/Downloads
wget -O android-sdk.tgz 'https://dl.google.com/android/android-sdk_r23.0.2-linux.tgz'
tar -xvzf android-sdk.tgz -C ~/
cd ~/
rm -rf sdk
mv android-sdk-linux/ sdk/
chmod 777 -R sdk
rm -f ~/Downloads/android-sdk.tgz

#Add android-studio and sdk to your PATH
echo "export PATH=\$PATH:~/sdk/tools:~/sdk/platform-tools:/opt/android-studio/bin">> ~/.bashrc
echo "export ANDROID_HOME=~/sdk">> ~/.bashrc

export PATH=$PATH:~/sdk/tools:~/sdk/platform-tools:/opt/android-studio/bin
export ANDROID_HOME=~/sdk

#from http://stackoverflow.com/questions/17963508/how-to-install-android-sdk-build-tools-on-the-command-line
#add package to android sdk
echo yes | android update sdk -u -a -t 1,2,3,9,16,19,25,27,30,108,109,115

#   android sdk number (the number will change in the future, and 
#   need to update by name.
:' 
   1- Android SDK Tools, revision 23.0.5
   2- Android SDK Platform-tools, revision 21
   3- Android SDK Build-tools, revision 21.1.1
   9- Android SDK Build-tools, revision 19.1
  16- Android SDK Build-tools, revision 18.0.1
  19- SDK Platform Android 5.0, API 21, revision 1
  25- SDK Platform Android 4.0.3, API 15, revision 5
  27- SDK Platform Android 3.2, API 13, revision 1
  30- SDK Platform Android 2.3.3, API 10, revision 2
 108- Android Support Repository, revision 8
 109- Android Support Library, revision 21.0.1
 115- Google Repository, revision 13
'
