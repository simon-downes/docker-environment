#!/bin/bash

function usage {
	echo "Usage: $0 <container-name> <sites-path> <logs-path>

<container-name> - name of the docker container
<sites-path> - path to the sites directory
<logs-path> - path to the logs directory
"
   	exit
}

if [ "$#" -ne 3 ]; then
	usage
fi

# get absolute paths
SITES_DIR=`readlink -e $2`
LOGS_DIR=`readlink -e $3`

if [ -z "${SITES_DIR}" ]; then
	echo "Invalid sites directory"; echo
	usage
elif [ -z "${LOGS_DIR}" ]; then
	echo "Invalid logs directory"; echo
	usage
fi

sudo docker run --name ${1} \
    -v ${SITES_DIR}:/mnt/sites:ro \
    -v ${LOGS_DIR}:/mnt/logs \
    -d -p 80:80 simon-nginx
