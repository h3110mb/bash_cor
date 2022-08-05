#!/bin/bash
echo
if [ "$1" == ]
then
echo "Enter IP range"
echo " syntax: ./pingsweep.sh 1.1.1"
else
for ip in `seq 1 254`;do
ping -c 1 $1.$ip | grep "64 bytes" |cut -d "" -f 4
done
fi

