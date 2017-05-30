#!/bin/bash
# Sets the SSH_PASSWORD and SSH_URL
USERNAME='vagrant'
HOST='192.168.205.11'

for i in "$@"
do
case $i in
    -u=*|--prefix=*)
    USERNAME="${i#*=}"
    ;;
    -h=*|--searchpath=*)
    HOST="${i#*=}"
    ;;
    *)
            # unknown option
    ;;
esac
done


echo -n "Password: "
read -s PASSWORD
echo

export SSH_URL="${USERNAME}@${HOST}"
export SSH_PASSWORD=$PASSWORD

