#!/bin/bash

# This file will reboot all of the systems
ssh-add ~/.ssh/ansible
#ansible all -a '/usr/bin/notify-send "Shutting Down" "The Computers are shutting down in 30 seconds"' -u it --become --ask-become-pass --become-user=root
ansible all -a '/sbin/shutdown -h +1' -u it --become --ask-become-pass --become-user=root -i hosts

#sleep 30s

#ansible-playbook /home/joe/Documents/src/ansible/ansible-ubuntu-classroom/shutdown.yml  -i /home/joe/Documents/src/ansible/ansible-ubuntu-classroom/hosts
