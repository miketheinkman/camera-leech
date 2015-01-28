#!/bin/bash


STATE="$(adb get-state)"



if [ "$STATE" != "unknown" ] ; then 
echo "device"
	sleep 15

		./picupload.sh



	elif [ "$STATE" != "device" ] ; then

		sleep 5
echo "no device"
exit 0

fi

echo "waiting"

adb kill-server
adb start-server

adb wait-for-device




adb get-state

if [ "$STATE" != "device" ] ; then
	
		echo "waiting for device" 

	elif [ "$STATE" = "device" ] ; then 

		echo "Backing up photos"

			adb pull /sdcard/DCIM/Camera ~/Desktop/pic-backup

				mv ~/Desktop/pic-backup/*.mp4 ~/Desktop/video-backup

			./picupload.sh

fi

sleep 5

./picupload.sh

    
exit 0





