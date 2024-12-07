#!/bin/sh

SSH_HOST=$1
SSH_USER=$2
HOST_PATH=$3
ELLIPTIC_KEY=$4
HOST_ENTRY=$5
SSH_PORT=${6:-22}
LOCAL_PATH=${7:-.}

SSH_PATH=/root/.ssh
mkdir -p $SSH_PATH
echo "$ELLIPTIC_KEY" > $SSH_PATH/id_ed25519
echo "$HOST_ENTRY" > $SSH_PATH/known_hosts
chmod 600 $SSH_PATH/*

rsync -rvulti -e "ssh -p $SSH_PORT" --exclude .git --delete-after "$LOCAL_PATH" "$SSH_USER"@"$SSH_HOST":"$HOST_PATH"
