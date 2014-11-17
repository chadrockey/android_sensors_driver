#!/bin/bash

#from http://wiki.ros.org/rosjava/Tutorials/indigo/Installation

#3.1 Preparation
sudo apt-get install ros-indigo-catkin ros-indigo-ros python-wstool

#3.2 Sources

mkdir -p ~/rosjava
wstool init -j4 ~/rosjava/src https://raw.githubusercontent.com/yujinrobot/yujin_tools/master/rosinstalls/indigo/rosjava.rosinstall
source /opt/ros/indigo/setup.bash
cd ~/rosjava
# Make sure we've got all rosdeps and msg packages.
rosdep update
rosdep install --from-paths src -i -y
catkin_make

echo "source ~/rosjava/devel/setup.bash">> ~/.bashrc

#install java orcle jdk
install-java-jdk.sh
