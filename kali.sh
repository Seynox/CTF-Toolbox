#!/bin/sh

function checkKaliImage() {
	imageExist=$(/usr/bin/docker images -f reference=kali --format 0)
	if ! [ $imageExist ]
	then
		echo "Kali image does not exist"
		exit
	fi
}

function doesContainerExist() {
	containerExist=$(docker ps -af name=kali --format 0)
	[ $containerExist ]
}

function isContainerRunning() {
	isRunning=$(docker ps -f name=kali --format 0)
	[ $isRunning ]
}

function runContainer() {
	/usr/bin/xhost +local:$USER &&
		/usr/bin/docker run -it --name kali -u 1000 -w /CTF -e DISPLAY -e XDG_RUNTIME_DIR --net=host -v ~/CTF:/CTF kali &&
		/usr/bin/xhost -local:$USER
}

function startContainer() {
	xhost +local:$USER && docker start -ia kali && xhost -local:$USER
}

function attachShellToContainer() {
	docker exec -it kali bash
}

checkKaliImage
if doesContainerExist; then
	if isContainerRunning; then
		echo "Attaching shell to container.."
		attachShellToContainer	
	else
		echo "Starting container.."
		startContainer
	fi
else
	echo "Running new kali container.."
	runContainer
fi
