#!/bin/sh

cloudflare=`curl -s 'https://www.cloudflare.com/cdn-cgi/trace'`
ip=`echo $cloudflare | awk -F"[ =]" '{printf "%s",$6}'`

if [[ $ip == *"."* ]]; then
  filteredIp=`echo $ip | awk -F '.' '{print $1"."$2"."$3".xxx"}'`
fi

if [[ $ip == *":"* ]]; then
  filteredIp=`echo $ip | awk -F ':' '{print $1"::::::"$7":"$8}'`
fi

location=`echo $cloudflare | awk -F"[ =]" '{printf "%s",$18}'`

echo $filteredIp $location

