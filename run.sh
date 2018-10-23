#!/bin/bash
set -eux
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR
source .env

mkdir -p var

TMPNAME=$(date +%y%m%d%H%M%S)"-"$DCR_IMAGE_NAME

docker build -t $DCR_IMAGE_NAME .
docker volume create $TMPNAME

docker run --rm -i \
	-v $TMPNAME:/app \
	-e MINECRAFT_VERSION=$MINECRAFT_VERSION \
	$DCR_IMAGE_NAME spigot-build

docker run --rm -i \
	-v $TMPNAME:/app \
	-e MINECRAFT_VERSION=$MINECRAFT_VERSION \
	$DCR_IMAGE_NAME spigot-fetch > var/spigot-$MINECRAFT_VERSION.jar

docker volume remove $TMPNAME

cat var/spigot-$MINECRAFT_VERSION.jar | $PUSH_SSH_CMD "cat > $PUSH_SSH_PATH/spigot-$MINECRAFT_VERSION.jar"

