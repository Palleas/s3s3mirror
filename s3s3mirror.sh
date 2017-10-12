#!/bin/bash

THISDIR=$(cd "$(dirname $0)" && pwd)

VERSION=1.2.6
JARFILE="${THISDIR}/target/s3s3mirror-${VERSION}-SNAPSHOT.jar"
VERSION_ARG="-Ds3s3mirror.version=${VERSION}"
LOGS_ARG="-Dlog4j.configuration=file:${THISDIR}/target/conf/log4j.xml"

DEBUG=$1
if [ "${DEBUG}" = "--debug" ] ; then
  shift   # remove --debug from options
  java ${LOGS_ARG} -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005 ${VERSION_ARG} -jar "${JARFILE}" "$@"

else
  # Run in regular mode
  java ${VERSION_ARG} ${LOGS_ARG} -jar "${JARFILE}" "$@"
fi

exit $?

