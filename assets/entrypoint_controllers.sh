#!/bin/bash

# source ROS and code
source /opt/ros/$ROS_DISTRO/setup.bash
source /home/software/catkin_ws/devel/setup.bash

# launch controllers
roslaunch --wait blockly_controller blockly_controller.launch veh:=$HOSTNAME
