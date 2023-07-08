#!/bin/sh
echo "Installing docker"
export DEBIAN_FRONTEND=noninteractive

set -e
apt-get update
apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
OF=/usr/share/keyrings/docker-archive-keyring.gpg
if [ ! -f "$OF" ]
then
	echo "Downloading missing $OF"
	curl -fsSL  https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o "$OF"
fi

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  bullseye stable" | sudo tee /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
gpasswd -a vagrant docker
