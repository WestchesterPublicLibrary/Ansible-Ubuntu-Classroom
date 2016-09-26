#! /bin/bash

mount -a
rsync -qrpog --delete --exclude='.X*' /mnt/profiles/classroom/public/ /home/public	echo ""> /home/public/.local/share/recently-used.xbel
