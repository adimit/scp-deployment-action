#!/bin/sh

# Set up SSH secrets
test -n $ELLIPTIC_KEY || (echo "Need elliptic key" && exit 1)
test -n $HOST_KEY || (echo "Need host key" && exit 1)

SSH_PATH=$HOME/.ssh
mkdir -p $SSH_PATH
echo "$ELLIPTIC_KEY" > $SSH_PATH/id_ed25519
echo "$HOST_ENTRY" > $SSH_PATH/known_hosts
chmod 400 $SSH_PATH/*

env

ls -R $GITHUB_WORKTREE

cat $SSH_PATH/*

echo $*
echo $@

