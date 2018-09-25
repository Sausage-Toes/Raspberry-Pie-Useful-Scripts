# Raspberry-Pie-Useful-Scripts
Useful commands and scripts for managing and configuring Raspberry Pie Debian

### Monitor output of a script
```Shell
watch --color /home/pi/get_pi_temp.sh
```
### Set executable permission on shell script file:
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

#### Individual update commands:
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
```


### Update RPI Firmware
```Shell
sudo rpi-update
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


### List the disk partitions on the device. 
```Shell
sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL
```

### List filesystems
```Shell
df -h
```

### To mount FAT with read/write capability 
```Shell
mount -t vfat -o umask=000 /dev/sde1 /mnt/fat
```

### To mount NTFS with read/write capability
```Shell
mount -t ntfs -o umask=000 /dev/sdd1 /mnt/ntfs
```

### List network interfaces
```Shell
sudo ifconfig
```

### Show Kernal IP routing table
```Shell
sudo route -n
```

###   /etc/dhcpcd.conf
```Shell
# Static IP configuration
interface eth0
  static ip_address=192.168.1.XXX/24
  static routers=192.168.1.1
  static domain_name_servers=8.8.8.8
```

### /etc/network/interfaces
```Shell
iface eth0 inet static
address 192.168.1.XXX
netmask 255.255.255.0
network 192.168.1.0
broadcast 192.168.1.255
gateway 192.168.1.1
```
