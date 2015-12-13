#Script created Thu Jan  1 00:05:27 UTC 1970
#CameraParams: 400 1100 n n y
#TimeLapseParams: 10 n y 12

#Set ISO and exposure
t ia2 -ae exp 400 1100

#Set auto-whitebalance
t ia2 -awb off

#Create RAW files
t app test debug_dump 14


