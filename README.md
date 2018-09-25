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
