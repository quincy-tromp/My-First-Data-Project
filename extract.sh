#!/bin/zsh

FILENAME=`ls ~/Downloads/*.csv`&& FPATH=`readlink -f $FILENAME`
echo "\nexport FPATH=${FPATH}" > venv/config.cfg