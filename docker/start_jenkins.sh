#!/bin/bash	

## Define the container name to be used on all places along this script.
# If it is not na oficial image, set the builder too. Do not forget to add
# a slash at the end, like in "BUILDER=wesleyit/myimage"
BUILDER=''
CONTAINER='jenkins'
VERSION='2.3'

## Set the ports used by the service
HOST_PORT=8080
CONTAINER_PORT=8080
HOST_PORT2=50000
CONTAINER_PORT2=50000

## This is the persistence directory
STORE_DIR="/var/lib/docker/storage/$CONTAINER"
CONTAINER_DATA_DIR='/var/jenkins_home'

## Verify if the container exists
function is_created() {
	docker ps -a | grep -q "$1"
	return "$?"
}

## Verify if there is an instance of this container executing at this moment
function is_running() {
	docker ps | grep -q "$1"
	return "$?"
}

## We need to guarantee the directory exists and is writable
mkdir -p $STORE_DIR && chmod 777 $STORE_DIR

if is_created $CONTAINER
then
	if is_running $CONTAINER
	then
		echo -n "Killing container "
		docker kill $CONTAINER
	fi
	echo -n "Deleting container "
	docker rm $CONTAINER
	sleep 5
fi
echo -n "Starting container $CONTAINER "
docker run -d \
--name "$CONTAINER" \
-p "$HOST_PORT":"$CONTAINER_PORT" \
-p "$HOST_PORT2":"$CONTAINER_PORT2" \
-v "$STORE_DIR":"$CONTAINER_DATA_DIR:Z" \
"$BUILDER""$CONTAINER":"$VERSION"
