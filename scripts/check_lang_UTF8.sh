#!/bin/bash

echo
echo
echo "******************************************************"
echo "*"
echo "* Checking for valid UTF-8 locale...."
echo "*"
echo "*"
echo "******************************************************"
echo ""	
	
echo $LANG|grep UTF-8 1>/dev/null
RESULT=$?

if [ $RESULT -eq 1 ]; then
	echo "******* WARNING: LANG environment variable not set to a UTF-8 locale - this could cause problems extracting the source archive and building"
	echo ""
	echo "Valid UTF-8 locales are:"
	echo ""
	locale -a |grep UTF-8
else
	echo "UTF-8 locale found"
fi

echo ""

exit $RESULT