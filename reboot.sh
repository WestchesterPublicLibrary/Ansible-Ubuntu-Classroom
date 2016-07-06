#!/bin/bash

# This file will reboot all of the systems
ansible all -a "/sbin/shutdown -r now" -u it --become --ask-become-pass --become-user=root --ask-pass
