#!/bin/bash

DB_COMMANDS_PATH=${db.commands.path}
DB_NAME=${dspace.db.name}
DB_USER=${dspace.db.user}
DB_PASS=${dspace.db.pass}
DB_HOST=${dspace.db.host}
DB_PORT=${dspace.db.port}
EXPECT_SCRIPT_DIR=${filtered.dir}

OLDPATH=$PATH
PATH=${DB_COMMANDS_PATH}:${PATH}

EXIT_CODE=0
RESULT_STR=""

echo
echo
echo "******************************************************"
echo "*"
echo "* CREATING DATABASE"
echo "*"
echo "* DB_COMMANDS_PATH=${DB_COMMANDS_PATH}"
echo "* DB_NAME=${DB_NAME}"
echo "* DB_USER=${DB_USER}"
echo "* DB_PASS=${DB_PASS}"
echo "* DB_HOST=${DB_HOST}"
echo "* DB_PORT=${DB_PORT}"
echo "*"


${expect.path} ${EXPECT_SCRIPT_DIR}/postgres_createuser.exp

if [ $? -ne 0 ]; then
	EXIT_CODE=1
	RESULT_STR="Failed to create DB user"
else
	createdb -U postgres -p ${DB_PORT} -h ${DB_HOST} -O ${DB_USER} -E UNICODE ${DB_NAME}
	if [ $? -ne 0 ]; then
		EXIT_CODE=1
		RESULT_STR="Failed to create DB"
	fi
fi

if [ ${EXIT_CODE} -ne 0 ]; then
	echo "* ERROR: ${RESULT_STR}"
else
	echo "* DB created "
fi

echo "*"
echo "******************************************************"


PATH=${OLDPATH}

exit ${EXIT_CODE}