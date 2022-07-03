#!/bin/bash
today=$( date +%s )
get_expiry_date=$( echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -enddate | cut -d "=" -f 2 )
expiry_date=$( date -d "$get_expiry_date" +%s )
expiry_days_left="$(( ($expiry_date - $today) / (3600 * 24) ))"
echo "    $expiry_days_left"
