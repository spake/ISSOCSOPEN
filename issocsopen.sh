#!/bin/bash
status=`wget -q -O - issocsopen.com | egrep '(OPEN|CLOSED)' | tr -d ' '`
if [ "$status" == OPEN -a "`cat ~/issocsopen/prevstatus`" != OPEN ]
then
	curl -s --data "api_token=<API_TOKEN_HERE>" http://api.justyo.co/yoall/ > /dev/null
fi
echo "$status" > ~/issocsopen/prevstatus
