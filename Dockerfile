# Base image
FROM duckietown/rpi-duckiebot-base:latest

# enable ARM
RUN [ "cross-build-start" ]

# switch branch (TODO: remove once merged to master)
RUN git clone -b afdaniele-blockly --depth 1 https://github.com/duckietown/Software /tmp/software && mv /tmp/software/catkin_ws/src/95-blockly /home/software/catkin_ws/src/ && rm -rf /tmp/software
RUN . /opt/ros/$ROS_DISTRO/setup.sh && catkin_make -C /home/software/catkin_ws -DCATKIN_WHITELIST_PACKAGES="blockly_controller"

# setup entrypoint
COPY assets/* /root/
RUN chmod +x /root/entrypoint_controllers.sh

# disable ARM
RUN [ "cross-build-end" ]

# configure entrypoint
ENTRYPOINT ["/ros_entrypoint.sh", "/root/entrypoint_controllers.sh"]
