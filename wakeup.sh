#!/bin/bash

# This is using the awake python script
# https://github.com/cyraxjoe/awake
# pip install awake
TEST=$(command -v awake)
if [ $TEST ]; then
    awake -f $PWD/itClassroom.wol
else
    pip install awake --user --upgrade
    awake -f $PWD/itClassroom.wol
fi
