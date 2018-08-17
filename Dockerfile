# Base image
FROM duckietown/rpi-duckiebot-base:latest

# enable ARM
RUN [ "cross-build-start" ]

# switch branch (TODO: remove once merged to master)
RUN git -C /home/software/ checkout afdaniele-blockly

# setup entrypoint
COPY assets/blockly_controllers.launch /root/blockly_controllers.launch
COPY assets/entrypoint_controllers.sh /root/entrypoint_controllers.sh
RUN ["chmod", "+x", "/root/entrypoint_controllers.sh"]

# disable ARM
RUN [ "cross-build-end" ]

# configure entrypoint
ENTRYPOINT ["/ros_entrypoint.sh", "/root/entrypoint_controllers.sh"]
