#!/bin/bash

/usr/bin/zcat -f $(ls -tr /var/log/apt/history.log*) | /usr/bin/awk '/^Start-Date:/ {d=substr($0,13); u=""} /^Upgrade:/ {u=substr($0,10)} /^End-Date:/ {if (u!="") {ld=d; lu=u}} END {gsub(/ \([^)]*\)/, "", lu); gsub(/, /, "|", lu); if (ld!="") print ld "|" lu}'

# End of file
