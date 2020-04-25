#!/bin/bash

#dump1090 runtime directory for json output
mkdir -p /run/dump1090-fa
chmod 755 /run/dump1090-fa

#start webserver
/etc/init.d/lighttpd start

CUSTOM_OPTIONS=""
if [ -n "${RECEIVER_LATITUDE}" ] && [ -n "${RECEIVER_LONGITUDE}" ]; then
  CUSTOM_OPTIONS="${CUSTOM_OPTIONS} --lat ${RECEIVER_LATITUDE} --lon ${RECEIVER_LONGITUDE}"
fi

#start dump1090
/usr/share/dump1090-fa/start-dump1090-fa --write-json /run/dump1090-fa --quiet ${CUSTOM_OPTIONS}
