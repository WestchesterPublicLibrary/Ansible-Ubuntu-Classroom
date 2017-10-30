#! /bin/bash

rm -f /opt/public/.cache
mkdir -p /mnt/cache/{mozilla,google-chrome}
rsync -qrpog --delete --exclude='.X*' /opt/public/ /home/public
echo "" > /home/public/.local/share/recently-used.xbel