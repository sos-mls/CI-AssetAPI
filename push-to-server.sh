#!/bin/bash

# setup ssh information.
. "helpers/get-ssh-info.sh"

COMMANDS[0]="echo '${SSH_PASSWORD}' | sudo -S rm -rf assetapi"
COMMANDS[1]="git clone https://bitbucket.org/scooblyboo/assetapi.git"
COMMANDS[2]="echo '${SSH_PASSWORD}' | sudo rsync -a assetapi/src/ /var/www/asset_api/src/"
COMMANDS[3]="echo '${SSH_PASSWORD}' | sudo rsync -a assetapi/vagrant/ install/"
COMMANDS[4]="echo '${SSH_PASSWORD}' | sudo rsync -a assetapi/sql/ sql/"
COMMANDS[5]="echo '${SSH_PASSWORD}' | sudo chown www-data:www-data -R /var/www/assetapi"
COMMANDS[6]="bash install/composer.sh"
COMMANDS[7]="bash install/bower.sh"

n_elements=${#COMMANDS[@]}

for ((i = 0; i < $n_elements; i ++)); do
	sshpass -p $SSH_PASSWORD ssh $SSH_URL ${COMMANDS[i]}
done

# unset ssh information
. "helpers/unset-ssh-info.sh"
