#!/bin/sh

if [ -z $1 ]; then
	HOST=karu
else
	HOST=$1
fi

ssh $HOST sudo pkill inputpipe-clien
ssh -f -R 7192:localhost:7192 $HOST "sudo ~/inputpipe/inputpipe-client --input-path /dev/input -k 127.0.0.1"
sudo ./inputpipe-server -d /dev/uinput
ssh $HOST sudo pkill inputpipe-clien