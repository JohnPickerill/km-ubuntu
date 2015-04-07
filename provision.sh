#!/usr/bin/env bash

 
sudo apt-get -y update


if [ ! -f /var/log/vmsetup ];
then
# apache
sudo apt-get -y install apache2
sudo apt-get -y install libapache2-mod-wsgi python-dev 
#python - flask
sudo apt-get -y install python-pip 
sudo pip install -r /vagrant/requirements.pip
sudo pip install virtualenv 
cd /vagrant/km-prototype-a
sudo virtualenv venv --always-copy 
#elasticsearch
cd ~
sudo apt-get install -y  openjdk-6-jre
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.deb
dpkg -i elasticsearch-0.90.7.deb
	


#    touch /var/log/vmsetup
fi