# Raspberry-Pie-Useful-Scripts
Useful commands and scripts for managing and configuring Raspberry Pie Debian

### Monitor output of a script
```Shell
watch --color /home/pi/get_pi_temp.sh
```
###Set executable permission on shell script file:
```Shell
chmod +x get_pi_temp.sh
```

### Configure Raspberry Pie specific devices and options
```Shell
sudo raspi-config
```

### Update OS Distro
```Shell
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
```

### Update RPI Firmware
```Shell
sudo rpi-update
```

### List the disk partitions on the device. 
```Shell
sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL
```

### List filesystems
```Shell
df -h
```



### Get status of CPU thermal/under-voltage throttleing 
```Shell
vcgencmd get_throttled
```
|bit|flag|
|---|:---|
|0: |under-voltage|
|1: |arm frequency capped|
|2: |currently throttled |
|3: |under-voltage has occurred|
|4: |arm frequency capped has occurred|
|5: |throttling has occurred|

_example output (no throttling has occurred)_
```
throttled=0x0
```
_example output (under-voltage)_
```
throttled=0x50000
```

### List network interfaces
```Shell
sudo ifconfig
```

### Show Kernal IP routing table
```Shell
sudo route -n
```
