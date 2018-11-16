# Base image
FROM duckietown/rpi-duckiebot-base:master18

# enable ARM
RUN [ "cross-build-start" ]

# copy entrypoint
COPY assets/entrypoint_controllers.sh /root/entrypoint_controllers.sh

# disable ARM
RUN [ "cross-build-end" ]

# configure entrypoint
ENTRYPOINT ["/ros_entrypoint.sh", "/root/entrypoint_controllers.sh"]
