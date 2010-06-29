#!/bin/bash
directory="/Volumes/KiWi"
if [ -w $directory ];then
	echo "already mounted"
else 
	mkdir -p $directory 
	sshfs -p 54321 root@totoya.pms.ifi.lmu.de:/root/KiWi $directory 
fi 
