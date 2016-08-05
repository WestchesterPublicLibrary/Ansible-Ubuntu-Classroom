#!/bin/bash

mkdir -p ~/.config/systemd/user/
cp gnome-background-change.* ~/.config/systemd/user/

systemctl --user enable gnome-background-change.timer
systemctl --user start gnome-background-change.timer
