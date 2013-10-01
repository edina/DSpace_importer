#!/bin/bash

DSPACE_VERSION=${dspace.version}
DSPACE_BUILD_DIR="${patched.src.dir}/dspace/target/${dspace.prefix}${dspace.version}-build"
PROP_FILE=${dspace.ant.dir.prop_file}

EXIT_CODE=0

echo
echo
echo "******************************************************"
echo "*"
echo "* Determining DSpace build directory location"
echo "*"
echo "* DSPACE_VERSION=${DSPACE_VERSION}"
echo "*"

if [ "${DSPACE_VERSION}" = "1.5.2" -o "${DSPACE_VERSION}" = "1.6.0" -o "${DSPACE_VERSION}" = "1.6.1" -o "${DSPACE_VERSION}" = "1.6.2" -o "${DSPACE_VERSION}" = "1.7.0" -o "${DSPACE_VERSION}" = "1.7.1" -o "${DSPACE_VERSION}" = "1.7.2" ]; then
	DSPACE_BUILD_DIR="${DSPACE_BUILD_DIR}.dir"
fi

echo "dspace.ant.dir=${DSPACE_BUILD_DIR}" > ${PROP_FILE}


if [ $? -ne 0 ]; then
	EXIT_CODE=1
	echo "* ERROR: Failed to create properties file at: ${PROP_FILE}"
else
	echo "* Properties file created at: ${PROP_FILE}"
fi

echo "*"
echo "******************************************************"

exit ${EXIT_CODE}