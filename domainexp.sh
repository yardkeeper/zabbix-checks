#!/bin/bash
edate="$(whois $1|egrep 'Expiry|Expiration|paid-till'|sed $'s/[^[:digit:]\t]//g'|sed 's/.\{6\}$//')"
edate="$(date -d"$edate" +%s)"
cdate="$(date +%s)"
echo  "$(((edate-cdate)/86400))"
