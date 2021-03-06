#!/bin/bash


# @Author : SuetenaCoder
# @Website: suetena.cytrontech.com
# @EMail  : suetena_coder@outlook.com 
# @Version : 1.0.2   -02182017

mifiIPAdress='192.168.0.1'    #Default Mifi Address
interface='WIRELESS_INF_NAME'
interface_2='ETHERNET_INF_NAME'
routeMatric=30
serverUser='LOGIN_NAME'
listainPort=1082
wifiAP_SID='SID_NAME'
Passwd='SID_PASSWORD'

ethnetIP=$(ip addr | grep inet | grep enp1s0 | awk -F" " '{print $2}' | sed -e 's/\/.*$//')

echo "Connecting to AP SID : $wifiAP_SID  ..............."
echo 'Connecting .......................................'
echo 'other Wifi In the Air at this location ...........'
sudo nmcli d wifi list
sudo nmcli d wifi connect $wifiAP_SID password $Passwd iface $interface

echo ' .. Initializing Network Values '
echo ' .. Adding Default Mifi Route as Main Internet Route'
sudo ip route add default via $mifiIPAdress dev $interface proto static metric $routeMatric

echo ' .. Starting mifiProxy Server '
echo " .. Server Listaining on Port : $listainPort "
echo " .. USE: $ethnetIP:$listainPort Socks5_Proxy"
ssh -N -D 0.0.0.0:$listainPort $serverUser@localhost

# @Versio + Notes 
#   1.0.2 -  Added new automated wireless connection command for stored wireless connects to be automaticly 
#            Connected to the SID of Choice : YOU MUST SET THIS VALUE FOR - wifiAP_SID
