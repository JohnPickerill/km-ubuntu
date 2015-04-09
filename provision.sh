#!/usr/bin/env bash

 
sudo apt-get -y update


if [ ! -f /var/log/vmsetup ];
then
# apache
sudo apt-get -y install apache2
sudo apt-get -y install libapache2-mod-wsgi python-dev 
sudo mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.backup
sudo cp /vagrant/apache2.conf /etc/apache2/apache2.conf
#python - flask
sudo apt-get install python-openssl
sudo apt-get install libffi-dev libssl-dev
sudo apt-get install python
sudo apt-get -y install python-pip 
sudo pip install virtualenv 
sudo mkdir /home/apps
sudo chmod 777 /home/apps
cd /home/apps
mkdir km-prototype-a
cd km-prototype-a
#virtualenv venv 
#pip install -r /vagrant/requirements.pip 

#sudo ln -s /vagrant/km-prototype-a /home/apps/km-prototype-a

#elasticsearch
cd ~
#sudo apt-get install -y  openjdk-6-jre
#wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.deb
#dpkg -i elasticsearch-0.90.7.deb
	


#    touch /var/log/vmsetup
fi

#sudo service apache2 restart