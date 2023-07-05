#!/bin/sh
set -e
git clone https://github.com/e-m-b-a/emba.git
cd emba
sudo ./installer.sh -d

#echo install updater
#sudo cp config/emba_updater /etc/cron.daily/
