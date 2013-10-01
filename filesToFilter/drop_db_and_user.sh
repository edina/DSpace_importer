#!/bin/bash

DB_COMMANDS_PATH=${db.commands.path}
DB_NAME=${dspace.db.name}
DB_USER=${dspace.db.user}
DB_HOST=${dspace.db.host}
DB_PORT=${dspace.db.port}

OLDPATH=$PATH
PATH=${DB_COMMANDS_PATH}:${PATH}

EXIT_CODE=0
RESULT_STR=""
WARNING_STR=""

echo
echo
echo "******************************************************"
echo "*"
echo "* DROPPING DATABASE"
echo "*"
echo "* DB_COMMANDS_PATH=${DB_COMMANDS_PATH}"
echo "* DB_NAME=${DB_NAME}"
echo "* DB_HOST=${DB_HOST}"
echo "* DB_PORT=${DB_PORT}"
echo "*"



dropdb -U postgres -p ${DB_PORT} -h ${DB_HOST} ${DB_NAME}
if [ $? -ne 0 ]; then
	# Don't set the exit code here as the db may not exist. See if dropuser fails (will fail if the db exists)
	WARNING_STR="Failed to drop DB (may not exist?)"
else
	echo "* DB '${DB_NAME}' dropped "
fi

echo "*"
echo "*"
echo "* DROPPING DATABASE USER"
echo "*"
echo "* DB_USER=${DB_USER}"
echo "*"

dropuser -U postgres -p ${DB_PORT} -h ${DB_HOST} ${DB_USER}
if [ $? -ne 0 ]; then
	EXIT_CODE=1
	RESULT_STR="Failed to drop DB user"
fi

if [ ${EXIT_CODE} -ne 0 ]; then
	echo "* ERROR: ${RESULT_STR}"
else
	echo "* DB user '${DB_USER}' dropped "
fi

if [ ! -z "${WARNING_STR}" ]; then
	echo "* WARNING: ${WARNING_STR} "
fi

echo "*"
echo "******************************************************"


PATH=${OLDPATH}

exit ${EXIT_CODE}