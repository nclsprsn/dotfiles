#!/bin/sh

FAN=/proc/acpi/ibm/fan

if [ -f  "$FAN" ]; then
  echo "• $(cat /proc/acpi/ibm/fan | awk '$1 == "level:" { print $2 }') "
fi
