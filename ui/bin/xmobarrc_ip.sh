#!/bin/sh

cloudflare=`curl -s 'https://www.cloudflare.com/cdn-cgi/trace'`

ip=`echo $cloudflare | awk -F"[ =]" '{printf "%s",$6}'`
filteredIp=`echo $ip | awk -F '.' '{print $1"."$2"."$3".xxx"}'`
loc=`echo $cloudflare | awk -F"[ =]" '{printf "%s",$18}'`

network=''

if [[ $ip == 159.* ]]; then
  network='<fc=#94A65D>PR</fc>'
fi

echo $filteredIp $loc $network

