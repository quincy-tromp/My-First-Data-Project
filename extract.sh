#!/bin/bash

set -e

FILENAME=`ls ~/Downloads/*.csv`
FPATH=`readlink -f $FILENAME`
python transform_csv.py $FPATH