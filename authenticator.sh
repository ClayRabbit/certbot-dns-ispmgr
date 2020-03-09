#!/bin/sh

_dir="$(dirname "$0")"

. "$_dir/config.sh"

# Create TXT record
CREATE_DOMAIN="_acme-challenge"
if [ -n "$ISPMGR" ] && [ -n "$USER" ] && [ -n "$PASS" ]; then
    RESULT=$(curl -ksX POST "$ISPMGR" -d "func=domain.sublist.edit&sdtype=TXT&sok=ok" \
        --data-urlencode "authinfo=$USER:$PASS" \
        --data-urlencode "plid=$CERTBOT_DOMAIN" \
        --data-urlencode "name=$CREATE_DOMAIN" \
        --data-urlencode "addr=$CERTBOT_VALIDATION" )
else
    RESULT=$(/usr/local/ispmgr/sbin/mgrctl -m ispmgr domain.sublist.edit sdtype=TXT sok=ok \
        plid="$CERTBOT_DOMAIN" name="$CREATE_DOMAIN" addr="$CERTBOT_VALIDATION")
fi

# Sleep to make sure the change has time to propagate over to DNS
sleep "0$DELAY"

echo $RESULT
