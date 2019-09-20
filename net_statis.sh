#!/bin/sh
#开启流量监控
k=9006
i=1
while(( $i<=50 ))
    do
	iptables -A INPUT -p tcp --dport $k
    iptables -A OUTPUT -p tcp --sport $k
	let "k++"
    let "i++"
done
