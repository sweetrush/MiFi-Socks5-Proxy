
**@Author Suetena Loia AKA sweetrush**
**@website [suetena.cytrontech.com](https://suetena.cytrontech.com)**


# MiFi-Socks5-Proxy
A proxy server to use with your MiFi Device with a Linux Computer as the Proxy server to handle the Internet Traffic for the LAN

```
[MIFI Divice]-----[MifiProxy Server]
                          |
                   [LAN Router/Wifi-AP ]__[Computers connected]
                               \__[Computer Devices]
                               \__[Phone Devices]
                               \__[Other Internet Devices]
                               
```
##<Related Image>


# INSTALLATION 
Installing this proxy server is as simple as downloading it and running it on you machine.

## Requirements
  1. Install SSH Server
  2. IP commands 
  3. IP Tables

## Configure 
Before you can start using the server there are a few things that you need to configure before you run the MifiProxy Server. First you need to makde changes to the variables that are in the script to align it with your setup and network interfaces.

- Wifi Interface
Check that your wireless interface is connected to the Mifi Device and its getting an IP address from it. 
you can check this with the following command below.

```
> ifconfig 
```
from this command you can find out what your wireless card is getting as and IP if you have connected your Mifi Device to the Machine 
then you sould be getting the IP from it.Once you have that then you can configure the wireless interface as the variable in the script.

**variable**
```shell
mifiIPAdress='192.168.0.1'        #MiFi  Address
interface='wlp2s0'                #WIRELESS Interface Connected to MiFi
interface_2='enp1s0'              #ETHERNET Inferface Connected to LAN
routeMatric=30                    #PATH MATRIC
serverUser='sadmin'               #USER_NAME to use for Connecting
listainPort=1081                  #PORT_LISTAINING Port to Listain on for Proxyed Connections
```
- **[Var] mifiIPAdress**
This variable is the adderss of the Mifi Device or in other words the Address of the Gateway to the wireless interface if the Machine is connected to the MiFi in the variable shown above the address is _192.168.0.1_.

- **[Var] interface**
This Variable is refured to the wireless interface name of the machine this can be different on your machine for this one as shown above is _wlp2s0_. The Wireless interface usually starts with _w_ in other machines it is usally _wlan0_. So change this to fit your machine.

- **[Var] interface_2**
This one is the Ethernet inferface. Ethernet is usally seen as the network cable interface which is usually a cat5,cat5e for standard network cabling. Ehternet is usually denoted as _eth0 or eth1_ on many machine but for the one shown above its _enp1s0_.So Change this to meet your setup for your machine.

- **[Var] routeMatric**
In Networking Metric is usually what determines the best path to take. Because we want our traffic to go to this path where we will be using the wireless interface to route all internet traffic this is why we are changing this value through this variable. So in networking the lowest metric is the best path or route.So check with your route table if there is an interface with the lowest and make the wireless interface the lowest value by changing this value to a lower value.

- **[Var] serverUser**
This is the Username that you are going to use to connect to the server which is connecting to it locally. make sure that this user has access to use the ssh service and also part of the ssh group. If the user you are going to use is part of the sudo group then all is set and everything should be ok.

- **[Var] listainPort**
This will be the port that the server will listain on. so you can change this to what ever port you find best fits your setup. as for this variable its on port _1081_. You can leave this as it is as the defualt if you dont want to change it.

Thats about all that you need to configure to get the server going.

## RUNNING IT
Running the server is basicly just sourcing the file _mifiproxy.sh_. In other words just run the script with the following. In the Path that you place the script with.

1. Option One
```shell
PATH_OF_MIFI_PROXY> ./mifiproxy.sh
```

2. Option Two
```shell
PATH_OF_MIFI_PROXY> sh mifiproxy.sh
```

#Final Words
Hope you enjoy this small script very useful at times. Drop me a message or email **suetena_coder<at>outlook.com** let me know what something to change or suggest to linkup and improve this small server.
