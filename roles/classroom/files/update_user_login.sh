#! /bin/bash

mkdir -p /mnt/cache/
rsync -qrpog --delete --exclude='.X*' /home/public /opt/public/
echo "" > /home/public/.local/share/recently-used.xbel

PROFILEPATH="/opt/profiles/public"
MOZPATH="$PROFILEPATH/.mozilla/firefox/yhvo2oa7.default"
rm -rf $MOZPATH/bookmarkbackups/
rm -rf $MOZPATH/crashes/
rm -rf $MOZPATH/cookies.sqlite*
rm -rf $MOZPATH/session
rm -rf $MOZPATH/Crash\ Reports/
rm -rf $MOZPATH/Pending\ Pings/
rm -rf /opt/public/.cache