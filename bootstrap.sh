#!/usr/bin/env bash

# Env vars
MYSQL_ROOT_PASSWORD='foobar'

# Setup
mkdir -p /root/.provisioning

# Initial
apt-get update

# Apache
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

# MYSQL
DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server mysql-client
if [ -f /root/.provisioning/mysql_root_password ]; then
	_old_pass=$(cat /root/.provisioning/mysql_root_password)
	mysqladmin -u root --password=${_old_pass} password ${MYSQL_ROOT_PASSWORD}
else
	mysqladmin -u root password ${MYSQL_ROOT_PASSWORD}
fi
echo -n ${MYSQL_ROOT_PASSWORD} > /root/.provisioning/mysql_root_password

sed -i "s/^bind-address.*/bind-address = 0.0.0.0/g" /etc/mysql/my.cnf
service mysql restart
