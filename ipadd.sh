#! /bin/bash
mkdir -p /data/ipaddr
touch /data/ipaddr/ip.txt
#n=`sed -n "/$1/p" /data/ipaddr/ip.txt|uniq -c|awk '{print $1}'`
n=`sed -n "/$1/p" /data/ipaddr/ip.txt`
if [ ${#n} -eq 0 ]
then
 	echo "$1 is added" >> /data/ipaddr/ip.txt
else
	echo "$1 is repeated,enter new ip please!"
fi
