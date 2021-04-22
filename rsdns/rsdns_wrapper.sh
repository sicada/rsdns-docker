#!/bin/bash

echo "
#!/bin/bash
RSUSER=$RSDNS_USER
RSAPIKEY=$RSDNS_APIKEY
RSPATH=/root/rsdns/
" > /root/.rsdns_config

chmod 700 /root/.rsdns_config

echo "Updating DNS record for domain: $RSDNS_DOMAIN"

exec /root/rsdns/rsdns-dc.sh -n $RSDNS_DOMAIN >> /proc/1/fd/1 2>&1

exit 0
