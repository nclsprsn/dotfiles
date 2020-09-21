#! /bin/bash

currentDay=$(date '+%j')

life=`python -c "print('{:0.4f}'.format($(($(date +%s) - $(date -d"2015-01-01 00:00:00" +%s)))*100/(17*365*24*3600)))"`

oneYear=`python -c "print('{:0.4f}'.format((3600*24*365)*100/(17*365*24*3600)))"`


ratio=`python -c "print('{:0.4f}'.format($(($(date +%s) - $(date -d"2020-01-01 00:00:00" +%s)))*100/(365*24*3600)))"`

oneDay=`python -c "print('{:0.4f}'.format((3600*24)*100/(365*24*3600)))"`

echo "<fc=#5E8D87>$life</fc>% tg <fc=#CD5C5C>40y</fc> • <fc=#5E8D87>$oneYear</fc>% for <fc=#F0C674>1y</fc> • <fc=#B5BD68>$ratio</fc>% tg <fc=#CD5C5C>1y</fc> • <fc=#B5BD68>$oneDay</fc>% for <fc=#F0C674>1d</fc>"

