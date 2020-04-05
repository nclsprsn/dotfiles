#!/bin/bash

str=`amixer sget Master,0`
str1=${str#Simple*\[}
v1=${str1%%]*]}
il=`expr index "$str1" [`
o="off"
mutel=''

if [ ${str1:$il:3} == $o ]; then
    mutel='M';
fi

s=${str1:0:1}
str2=${str1#${str1:0:1}*\[}
str1=$str2
str2=${str1#${str1:0:1}*\]}
ir=`expr index "$str2" [`
muter=''

if [[ ${str2:$il:3} = $o ]]; then
    muter='M';
fi

v2=${str2%%]*]}
colorE="</fc>"
if [ $v2 == "[off]" ]
then
    colorPercentage="<fc=#4d4d4d>"
	colorStatus="<fc=#CD5C5C>"
else
    colorPercentage="<fc=#AAAAAA>"
	colorStatus="<fc=#4d4d4d>"
fi
v="$colorPercentage${v1}$colorE$colorStatus${v2}$colorE"
echo $v