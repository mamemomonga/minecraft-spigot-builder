#!/bin/bash
set -eu

case "${1:-}" in

	"root" )
		shift
		exec bash $@
		;;
	
	"spigot-build" )
		shift
		cd /app
		wget -c https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
		java -jar BuildTools.jar --rev $MINECRAFT_VERSION
		;;

	"spigot-fetch" )
		shift
		cat /app/spigot-$MINECRAFT_VERSION.jar 
		;;

	* )
		echo "USAGE: [ root | app ]"
		exit 1
		;;
esac
