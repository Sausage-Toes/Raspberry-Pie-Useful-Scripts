#!/bin/bash

upSeconds=$(/usr/bin/cut -d. -f1 /proc/uptime)
secs=$((upSeconds%60))
mins=$((upSeconds/60%60))
hours=$((upSeconds/3600%24))
days=$((upSeconds/86400))
UPTIME=$(printf "%d days, %02dh %02dm %02ds" "$days" "$hours" "$mins" "$secs")

cpuTempC=$(($(cat /sys/class/thermal/thermal_zone0/temp)/1000))
cpuTempF=$((cpuTempC*9/5+32))
gpuTempC=$(/opt/vc/bin/vcgencmd measure_temp)
gpuTempC=${gpuTempC:5:2}
gpuTempF=$((gpuTempC*9/5+32))

memTotal=$(grep MemTotal /proc/meminfo | awk {'print $2'})
memFree=$(grep MemFree /proc/meminfo | awk {'print $2'})
ipadd=$(ip route get 8.8.8.8 2>/dev/null | head -1 | cut -d' ' -f7)

cpuTempColor="$(tput bold)$(tput setaf 2)"
gpuTempColor="$(tput bold)$(tput setaf 2)"
if [[ $cpuTempC -gt 50 ]]; then
	cpuTempColor="$(tput bold)$(tput setaf 3)"
fi
if [[ $cpuTempC -gt 60 ]]; then
	cpuTempColor="$(tput bold)$(tput setaf 1)"
fi
if [[ $gpuTempC -gt 50 ]]; then
	gpuTempColor="$(tput bold)$(tput setaf 3)"
fi
if [[ $gpuTempC -gt 60 ]]; then
	gpuTempColor="$(tput bold)$(tput setaf 1)"
fi

rpiVersion=$(cat /sys/firmware/devicetree/base/model | tr '\0' '\n' )

releaseName=$(cat /etc/os-release  | grep 'PRETTY_NAME=' )

diskSpace=$(df -h | grep -E '/root') 

diskUsed=$(df -h | grep -E '/root' | awk '{ print $3 }' )
diskTotal=$(df -h | grep -E '/root' | awk '{ print $2 }' )

diskPercent=$(df -h | grep -E '/root' | awk '{ print $5 }')

#              1         2         3         4         5         6
#     12345678901234567890123456789012345678901234567890123456789012
echo "--------------------------------------------------------------"
echo ${rpiVersion}
echo ${releaseName} | cut -d '"' -f2
echo $(uname -srmo) 
echo "--------------------------------------------------------------"
echo $(tput setaf 7)$(tput bold)$(date +"%A, %e %B %Y, %r") $(tput sgr0 | sed 's/(B/ /')
echo Hostname...........: $(tput setaf 5)$(tput bold)$(hostname)$(tput sgr0 | sed 's/(B/ /') 
echo IP Address.........: $(tput setaf 6)$(tput bold)${ipadd} $(tput setaf 7) $(tput sgr0 | sed 's/(B/ /')
echo Uptime.............: ${UPTIME}
echo Temperature........: CPU: ${cpuTempColor}$cpuTempC°C/$cpuTempF°F$(tput sgr0 | sed 's/(B/ /') GPU: ${gpuTempColor}$gpuTempC°C/$gpuTempF°F$(tput sgr0 | sed 's/(B/ /')
echo Memory.............:  ${memFree} kB free ${memTotal} kB total
echo Disk...............: ${diskUsed} of ${diskTotal} \(${diskPercent}\) used.
echo "--------------------------------------------------------------"




