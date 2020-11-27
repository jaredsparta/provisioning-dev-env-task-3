#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available

# install nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

sudo apt-get install nginx -y

# finally, restart the nginx service so the new config takes hold
sudo service nginx restart

echo "export DB_HOST=192.168.10.200" >> ~/.bashrc

source ~/.bashrc

cd /home/ubuntu/app

sudo pm2 start app.js --update-env