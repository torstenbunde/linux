#!/bin/bash
SUBNET="192.168.1"

for i in {0..255}; do
  IP="$SUBNET.$i"
  HOSTNAME=$(dig +short -x "$IP" | sed 's/\.$//')

  if [ ! -z "$HOSTNAME" ]; then
    A_RECORD=$(dig +short "$HOSTNAME" | grep -E '^[0-9.]+$')
    if [ "$A_RECORD" == "$IP" ]; then
      echo "Domain: $HOSTNAME -> A-Record: $A_RECORD"
    fi
  fi
done
