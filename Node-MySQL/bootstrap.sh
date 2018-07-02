#!/usr/bin/env bash

# MySQL root password
PASSWORD='foobar'

# update / upgrade
sudo apt-get update
sudo apt-get -y upgrade

# MySQL with $PASSWORD
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get install -y mysql-server

# Node.js
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs