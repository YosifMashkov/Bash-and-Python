#!/bin/bash

# make variable

folderto=$(date +%Y-%m-%d)

# make the backup folder

cd /home/$USER/
mkdir $folderto

# make the backup and move it

cd

sudo tar -czvf /$HOME/$folderto/messages.tgz /var/log/messages
