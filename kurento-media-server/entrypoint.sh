#!/bin/bash -x
set -e

CONF=/etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini

if [ -n "$KMS_TURN_URL" ]; then
  echo "turnURL=$KMS_TURN_URL" > $CONF
fi

if [ -n "$KMS_STUN_IP" -a -n "$KMS_STUN_PORT" ]; then
  # Generate WebRtcEndpoint configuration
  echo "stunServerAddress=$KMS_STUN_IP" >> $CONF
  echo "stunServerPort=$KMS_STUN_PORT" >> $CONF
fi

# Remove ipv6 local loop until ipv6 is supported
cat /etc/hosts | sed '/::1/d' | tee /etc/hosts > /dev/null

echo "----------------------------------"
cat $CONF
echo "----------------------------------"

exec /usr/bin/kurento-media-server "$@"
