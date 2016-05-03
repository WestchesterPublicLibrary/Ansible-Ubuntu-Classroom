#!/bin/bash

# This is using the awake python script
# https://github.com/cyraxjoe/awake
# pip install awakepip install awake

awake -f itClassroom.wol
ansible-playbook update.yml -i hosts
ansible-playbook shutdownClass.yml -i hosts

