#!/bin/sh

echo "`curl -s ifconfig.me | awk -F '.' '{print $1"."$2"."$3".xxx"}'`"
