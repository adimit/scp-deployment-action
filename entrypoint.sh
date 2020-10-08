#!/bin/sh

SSH_HOST=$1
SSH_USER=$2
HOST_PATH=$3
ELLIPTIC_KEY=$4
HOST_ENTRY=$5

SSH_PATH=/root/.ssh
mkdir -p $SSH_PATH
echo "$ELLIPTIC_KEY" > $SSH_PATH/id_ed25519
echo "$HOST_ENTRY" > $SSH_PATH/ssh_known_hosts
chmod 600 $SSH_PATH/*

rsync -rvulti --exclude .git --delete-after . $SSH_USER@$SSH_HOST:$HOST_PATH
