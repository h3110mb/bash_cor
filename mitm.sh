#!/bin/bash

service dnsmasq restart
ifconfig wlan0 up
ifconfig wlan0 10.0.0.1/24
iptables -t nat -F
iptables -F
iptables -t nat -A ROUTING -o etho -j MASQUERADE/SYSNTAX
iptables -A forward -i wlan0 -o eth0 -j ACCEPT 
echo '1' > /proc/sys/net/ipv4/ip_forward
service hostapd restart
eth0target= ifconfig eth0 | grep "broadcast" | awk '{print $2}'
iptables -t nat -A prerouting -i wlan0 -p tcp --dport 80 -j DNAT --to-destination $eth0target:8080
iptables -t nat -A prerouting -i wlan0 -p tcp --dport 443 -j DNAT --to-destination $eth0target:8080
service apache2 restart
burpsuite
