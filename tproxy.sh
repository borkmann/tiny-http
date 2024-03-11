#!/bin/sh

iptables -t mangle -A PREROUTING -p tcp -m socket --transparent --nowildcard -j MARK --set-xmark 0x1/0x1
#iptables -t mangle -A PREROUTING -d 1.1.1.1/32  -p tcp -j TPROXY --on-port 8080 --on-ip 0.0.0.0 --tproxy-mark 0x1/0x1
ip rule add fwmark 1 lookup 100
ip route add local 0.0.0.0/0 dev lo table 100
