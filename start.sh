#!/bin/bash

#Launch Pipework and configure iptables
iptables -t nat -A POSTROUTING -j MASQUERADE
/pipework --wait

#Update cobbler settings
IP_ETH1=$(ifconfig eth1 | grep 'inet addr:' | cut -d":" -f2 | cut -d" " -f1)
# Update cobbler server IP adress
sed -i "s/127\.0\.0\.1/${IP_ETH1}/" /etc/cobbler/settings
# Update DHCP range
sed -i '/dhcp-range=192.168.1.5,192.168.1.200/c\dhcp-range=IP_START,IP_END' /etc/cobbler/dnsmasq.template
# Update DHCP options
sed -i '/dhcp-option=3,$next_server/c\dhcp-option=3,ROUTER\ndhcp-option=6,DNS' /etc/cobbler/dnsmasq.template

#prepare filesystem for the import
mkdir /mnt/cobbler

#launch services
service inetutils-inetd start
service dnsmasq start
service apache2 start
cobblerd && cobbler sync && cobbler get-loaders && service cobblerd stop

cobblerd -F
