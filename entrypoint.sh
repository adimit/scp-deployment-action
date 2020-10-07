#!/bin/sh

SSH_HOST=$1
SSH_USER=$2
HOST_PATH=$3
ELLIPTIC_KEY=$4
HOST_ENTRY=$5

SSH_PATH=/home/github/.ssh
mkdir -p $SSH_PATH
echo "$ELLIPTIC_KEY" > $SSH_PATH/id_ed25519
echo "$HOST_ENTRY" > /etc/ssh/ssh_known_hosts
chmod 600 $SSH_PATH/*

rsync -rvult . $SSH_USER@$SSH_HOST:$HOST_PATH
