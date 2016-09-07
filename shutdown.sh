#!/bin/bash

# This file will reboot all of the systems
ssh-add ~/.ssh/remote
#ansible all -a "/sbin/shutdown -h now" -u it --become --ask-become-pass --become-user=root
ansible all -a '/usr/bin/notify-send "Shutting Down" "The Computers are shutting down in 30 seconds"' -u it --become --ask-become-pass --become-user=root

sleep 30s

ansible-playbook /home/joe/Documents/src/ansible/ansible-ubuntu-classroom/shutdown.yml  -i /home/joe/Documents/src/ansible/ansible-ubuntu-classroom/hosts
