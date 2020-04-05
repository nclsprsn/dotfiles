#!/bin/sh
status=""
pgrep openvpn >/dev/null 2>&1 && status="<fc=#B5BD68>VPN</fc>"
echo ${status}
