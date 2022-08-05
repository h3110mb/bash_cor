#!/bin/sh
clear

#glogal variable
user=$(whoami)
break="==================================="
echo "Hello $user;Good Morning;Have a great day ahead" 
echo $break
echo "This is your current IP Adress"
echo $break
echo
ifconfig | grep broadcast
echo "Checking connectivity"
echo $break
echo
ping -c 2 bing.com
echo $break

rm file.txt 2>/dev/null

read -p "Press <enter> to continue"
echo
echo " Hello TEam"
echo



