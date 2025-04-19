#!/bin/sh

########################################################################
# Author: Nicolas Pierson
# Creation date: 2014-11-20
########################################################################

dir=${1:-.}
cd ${dir}
pwd
find ${dir} -print | sort -f | sed -e "s,^${dir},," -e "/^$/d" -e "s,[^/]*/\([^/]*\)$,\`-----\1," -e "s,[^/]*/, |     ,g"

# only display directory
#find ${dir} -type d -print | sort -f | sed -e "s,^${dir},," -e "/^$/d" -e "s,[^/]*/\([^/]*\)$,\`-----\1," -e "s,[^/]*/, |     ,g";