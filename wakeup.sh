#!/bin/bash

# This is using the awake python script
# https://github.com/cyraxjoe/awake
# pip install awake

TEST=$(which awake)
if [ $TEST ]; then
    awake -f $PWD/itClassroom.wol
else
    pip install awake --user --upgrade
fi