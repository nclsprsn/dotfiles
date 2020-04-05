#!/bin/sh

value=`xbacklight -get | awk -F "." '{print $1}'`

echo "<fc=#5A5F75>$value</fc>%"
