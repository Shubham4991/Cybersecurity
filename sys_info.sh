#!/bin/bash
output=~/research/sys_info.txt
ip=$(ip addr | grep inet | tail -3 | head -1 | awk -F" " '{print $2}')
suids=$(sudo find / -type f -perm /4000 2> /dev/null)

if [ ! -d $HOME/research ]
then
mkdir ~/research
fi

if [ -f $output ]
then
	>  $output
fi

if [ $UID != 0 ]
then
	echo "Please run this script with sudo."
	exit
fi

echo "A Quick System Audit Script cat" >> $output
date >> $output
echo "" >> $output
echo "Machine Type info:" >> $output 
echo $MACHTYPE >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP info: " $ip >> $output
echo "Hostname $(hostname -s)" >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf | grep nameserver >> $output
echo "Memory info:" >> $output
free -m >> $output
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output
echo -e "\nDisk Usage" >> $output
df -H | grep sda >> $output
echo -e "\nWho is logged in: \n $(who) \n" >> $output

echo "\nSUID files below" >> $output
$suids >> $output
echo -e "top 10 processes" >> $output
ps -aux  --sort -%mem | head >> ~/research/sys_info.txt >> $output
 

