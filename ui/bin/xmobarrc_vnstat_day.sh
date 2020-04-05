#!/bin/bash

INTERFACE='wlp2s0'

SIZE=$(vnstat -i $INTERFACE -d | grep `date +%m/%d/%Y` | awk -F "|" '{print $3}'| sed -e 's/^ *//' -e 's/ *$//')

echo "<fc=#B294BB>$SIZE</fc>"
