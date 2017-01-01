#!/bin/bash


# @Author : SuetenaCoder
# @Website: suetena.cytrontech.com
# @EMail  : suetena_coder@outlook.com 


mifiIPAdress='192.168.0.1'        #MiFi  Address
interface='wlp2s0'                #WIRELESS Interface Connected to MiFi
interface_2='enp1s0'              #ETHERNET Inferface Connected to LAN
routeMatric=30                    #PATH MATRIC
serverUser='proxyuser'               #USER_NAME to use for Connecting
listainPort=1081                  #PORT_LISTAINING Port to Listain on for Proxyed Connections
ethnetIP=$(ip addr | grep inet | grep enp1s0 | awk -F" " '{print $2}' | sed -e 's/\/.*$//')

echo ' .. Initializing Network Values '
echo ' .. Adding Default Mifi Route as Main Internet Route'
sudo ip route add default via $mifiIPAdress dev $interface proto static metric $routeMatric

echo ' .. Starting mifiProxy Server '
echo " .. Server Listaining on Port : $listainPort "
echo " .. USE: $ethnetIP:$listainPort Socks5_Proxy"
ssh -N -D 0.0.0.0:$listainPort $serverUser@localhost

