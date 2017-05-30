#!/bin/bash

# setup ssh information.
. "helpers/get-ssh-info.sh"

COMMANDS[0]="echo '${SSH_PASSWORD}' | sudo -S apt-get -y --force-yes install git"
COMMANDS[1]="git clone https://bitbucket.org/scooblyboo/assetapi.git"
COMMANDS[2]="sudo mkdir /var/www"
COMMANDS[3]="sudo mkdir /var/www/assetapi"
COMMANDS[4]="sudo mv assetapi/src /var/www/asset_api/src"
COMMANDS[5]="mv assetapi/vagrant install"
COMMANDS[6]="mv assetapi/sql sql"
COMMANDS[7]="sed -i 's/\/home\/vagrant/\/root/g' install/install.sh"
COMMANDS[8]="bash install/install.sh"
COMMANDS[9]="sudo mkdir /var/www/asset_api/src/assets"
COMMANDS[10]="sudo chown www-data:www-data -R /var/www/asset_api/src"

n_elements=${#COMMANDS[@]}

for ((i = 0; i < $n_elements; i ++)); do
	sshpass -p $SSH_PASSWORD ssh $SSH_URL ${COMMANDS[i]}
done

# unset ssh information
. "helpers/unset-ssh-info.sh"