branch=$(shell git rev-parse --abbrev-ref HEAD)

name=duckietown/rpi-duckiebot-blockly-controller:$(branch)

build:
	docker build -t $(name) .

push:
	docker push $(name)
