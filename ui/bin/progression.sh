#! /bin/bash

function ProgressBar() {
  let _progress=(${1}*100/${2}*100)/100
  let _done=(${_progress}*2)/10
  if [ $_done -le 20 ]; then
    let _left=20-$_done
  else
    let _left=0
    _done=20
    _progress=100
  fi

  _done=$(printf "<fc=#B5BD68>%${_done}s</fc>")
  _left=$(printf "%${_left}s")

#  echo -e "${_done// /#}${_left// /-} ${_progress}%"
  echo -e "${_done// /#}${_left// /-}"
}

currentDay=$(date '+%j')

life=`python -c "print('{:0.4f}'.format($(($(date +%s) - $(date -d"2015-01-01 00:00:00" +%s)))*100/(17*365*24*3600)))"`

oneYear=`python -c "print('{:0.4f}'.format((3600*24*365)*100/(17*365*24*3600)))"`

ratio=`python -c "print('{:0.4f}'.format($(($(date +%s) - $(date -d"2020-01-01 00:00:00" +%s)))*100/(365*24*3600)))"`

oneDay=`python -c "print('{:0.4f}'.format((3600*24)*100/(365*24*3600)))"`

#echo "<fc=#5E8D87>$life</fc>% tg <fc=#CD5C5C>40y</fc> • <fc=#5E8D87>$oneYear</fc>% for <fc=#F0C674>1y</fc> • <fc=#B5BD68>$ratio</fc>% tg <fc=#CD5C5C>1y</fc> • <fc=#B5BD68>$oneDay</fc>% for <fc=#F0C674>1d</fc> $(ProgressBar $(($(date +"%H")-6)) 12)"

echo " $(ProgressBar $(($(date +"%k")-6)) 12) • <fc=#5E8D87>$life</fc>% tg <fc=#CD5C5C>40y</fc> • <fc=#B5BD68>$ratio</fc>(+$oneDay)% tg <fc=#CD5C5C>1y</fc>"
