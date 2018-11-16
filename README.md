# rpi-duckiebot-blockly-controller

Dockerfile that deploys the ROS controller nodes that convert JSON commands from Blockly to
ROS messages for the Duckiebot.

## Linked Repositories

The Dockerfile in this repository creates a container with an entrypoint script that runs
the `blockly_wheel_controller` node in the `blockly_controller`.
