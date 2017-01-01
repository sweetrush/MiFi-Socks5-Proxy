
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

## INSTALLATION 
Installing this proxy server is as simple as downloading it and running it on you machine.
## Configure 
Before you can start using the server there are a few things that you need to configure before you run the MifiProxy Server. First you need to makde changes to the variables that are in the script to align it with your setup and network interfaces.

1. Wifi Interface
Check that your wireless interface is connected to the Mifi Device and its getting an IP address from it. 
you can check this with the following command below.

'
> ifconfig 
'
from this command you can find out what your wireless card is getting as and IP if you have connected your Mifi Device to the Machine 
then you sould be getting the IP from it.Once you have that then you can configure the wireless interface as the variable in the script.

**variable**
'mifiIPAdress='192.168.0.1'        #MiFi  Address
interface='wlp2s0'                #WIRELESS Interface Connected to MiFi
interface_2='enp1s0'              #ETHERNET Inferface Connected to LAN
routeMatric=30                    #PATH MATRIC
serverUser='sadmin'               #USER_NAME to use for Connecting
listainPort=1081                  #PORT_LISTAINING Port to Listain on for Proxyed Connections
'
##
