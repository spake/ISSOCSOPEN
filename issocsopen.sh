#!/bin/bash
ISSOCSOPEN_TOKEN=""
ISSOCSCLOSED_TOKEN=""

STATUS=`wget -q -O - issocsopen.com | egrep '(OPEN|CLOSED)' | tr -d ' '`
PREVFILE=~/issocsopen/prevstatus
if [ "$STATUS" == OPEN -a "`cat $PREVFILE`" != OPEN ]
then
	# yo ISSOCSOPEN
	curl -s --data "api_token=$ISSOCSOPEN_TOKEN" http://api.justyo.co/yoall/ > /dev/null
elif [ "$STATUS" == CLOSED -a "`cat $PREVFILE`" != CLOSED ]
	# yo ISSOCSCLOSED
	curl -s --data "api_token=$ISSOCSCLOSED_TOKEN" http://api.justyo.co/yoall/ > /dev/null
fi
echo "$STATUS" > $PREVFILE
