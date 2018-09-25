# Raspberry-Pie-Useful-Scripts
Useful commands and scripts for managing and configuring Raspberry Pie Debian

### Configure Raspberry Pie specific devices and options
```
sudo raspi-config
```

### Update OS Distro
```
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
```

### List the disk partitions on the device. 
```
sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL
```

### Get status of CPU thermal/under-voltage throttleing 
```
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
