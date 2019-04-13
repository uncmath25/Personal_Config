#!/bin/bash

CONFIG_DIR="$HOME/Documents/Config"

SSH_DIR="$HOME/.ssh"
BASH_PROFILE_PATH="$HOME/.bash_profile"
NANO_PROFILE_PATH="$HOME/.nanorc"
AWS_DIR="$HOME/.nanorc"
AWS_DIR="$HOME/.aws"

rm -rf $SSH_DIR
rm -rf $BASH_PROFILE_PATH
rm -rf $NANO_PROFILE_PATH
rm -rf $AWS_DIR

ln -s $CONFIG_DIR/ssh $SSH_DIR
ln -s $CONFIG_DIR/mac_bash_profile $BASH_PROFILE_PATH
ln -s $CONFIG_DIR/nano_config $NANO_PROFILE_PATH
ln -s $CONFIG_DIR/aws $AWS_DIR
