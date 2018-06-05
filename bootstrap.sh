#!/usr/bin/env bash

# MySQL root password
PASSWORD='foobar'

# update / upgrade
sudo apt-get update
sudo apt-get -y upgrade

# Apache
sudo apt-get install -y apache2

# MySQL with $PASSWORD
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get install -y mysql-server

# Python
sudo apt-get install -y python-minimal
sudo apt-get install -y python3-setuptools
sudo easy_install3 pip
sudo pip install virtualenv