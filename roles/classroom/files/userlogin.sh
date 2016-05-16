#! /bin/bash
	rsync -qrpog --delete --exclude='.X*' /opt/public/ /home/public
	echo ""> /home/public/.local/share/recently-used.xbel
