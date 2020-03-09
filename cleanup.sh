#!/bin/sh

_dir="$(dirname "$0")"

. "$_dir/config.sh"

# Remove the challenge TXT record from the zone
DOMAIN_ID="_acme-challenge.$CERTBOT_DOMAIN. TXT  $CERTBOT_VALIDATION"
if [ -n "$ISPMGR" ] && [ -n "$USER" ] && [ -n "$PASS" ]; then
    RESULT=$(curl -ksX POST "$ISPMGR" -d "func=domain.sublist.delete&sok=ok" \
        --data-urlencode "authinfo=$USER:$PASS" \
        --data-urlencode "plid=$CERTBOT_DOMAIN" \
        --data-urlencode "elid=$DOMAIN_ID" \
    )
else
    RESULT=$(/usr/local/ispmgr/sbin/mgrctl -m ispmgr domain.sublist.delete sok=ok "plid=$CERTBOT_DOMAIN" "elid=$DOMAIN_ID")
fi

echo $RESULT
