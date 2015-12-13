# xiaomiyi_script

#The steps for running XYC vary a little depending on what type of computer or phone you are using and the specifics of your telnet client software, but the general procedure is as follows:

#First time only: Copy the xyc.sh file to the top level of the camera's micro SD card.
#First time only: Create an empty file (no contents) named "enable_info_display.script", and place this at the top level of the camera's micro SD card. This file instructs the camera to start the telnet server when the camera turns on.
#Turn on the Xiaomi Yi's wifi, and connect your computer/phone to the xiaomi Yi's wifi network. (Using the official Xiaomi Yi app to connect to the Xiaomi Yi's wifi network may be helpful in this step).
#Use your telnet client to establish a telnet connection to the Xiaomi Yi. the IP address for the camera is 192.168.42.1. The user ID is "root", and there is no password.
#First time only: If this is the first time you are running XYC, you will need to change the file permissions for xyc.sh so that it can be executed. In order to do this, type the following command at the telnet console:
#chmod 755 /tmp/fuse_d/xyc.sh 
#Run XYC with the following command:
#/tmp/fuse_d/xyc.sh 
#XYC will present a menu of choices that allow you to view/adjust camera settings (exposure, ISO, auto-whitebalance, noise reduction and RAW format). Type a number to select a menu choice. Settings can be changed by entering numeric values or "y" or "n" responses. In most cases hitting "enter" will retain the default/current value for a setting. XYC also allows you to create a time-lapse script that will execute the next time the camera starts. The camera's built-in time-lapse feature does not appear to work correctly with RAW files, so XYC's time-lapse feature may be useful instead if shooting RAW files.
#After making any desired configuration changes, restart the camera in order for them to take effect.
