#!/bin/sh

while true;
  do reset;
  ls --color=auto /dev/sd*;
  echo;
  dfc -t -rootfs,dev,run,tmpfs,dev;
  sleep 15;
done