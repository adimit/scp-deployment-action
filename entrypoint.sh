#!/bin/sh

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

echo rsync -rvult $GITHUB_WORKTREE $SSH_USER@$SSH_HOST:$HOST_PATH
