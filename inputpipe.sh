#!/bin/bash


if [ -z $1 ]; then
	echo "Usage $0: [ssh hostname/ip to connect]"
	exit 1
else
	HOST=$1
fi

REMOTE_INPUTPIPE_CLIENT="/usr/local/bin/inputpipe-client"
LOCAL_INPUTPIPE_SERVER="/usr/local/bin/inputpipe-server"

ssh -f -R 7192:localhost:7192 ${HOST} "${REMOTE_INPUTPIPE_CLIENT} -k 127.0.0.1"
${LOCAL_INPUTPIPE_SERVER}
ssh $HOST pkill inputpipe-client

