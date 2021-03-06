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

sudo apt-get -y install python-openssl
sudo apt-get -y install libffi-dev 
sudo apt-get -y install libssl-dev
sudo apt-get -y install python
sudo apt-get -y install python-pip 

#elasticsearch
cd ~
sudo apt-get install -y python-software-properties
sudo apt-get install -y curl
# openjdk
sudo apt-get install -y  openjdk-7-jre
#or oracle - needs interactivity
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update
#sudo apt-get install oracle-java8-installer

#sudo apt-get install python-software-properties
#wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.deb
#dpkg -i elasticsearch-0.90.7.deb
#wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.4.deb
#dpkg -i elasticsearch-1.4.4.deb

#sudo wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
#sudo add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"
#sudo apt-get update && sudo apt-get install elasticsearch
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.deb
sudo dpkg -i elasticsearch-1.4.2.deb
 
# elastic search from zip for openshift
#https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.4.2.tar.gz 
# tar xf elasticsearch-1.4.2
# cd elasticsearch-1.4.2
#./bin/elasticsearch
 
### NOT starting elasticsearch by default on bootup, please execute
 sudo update-rc.d elasticsearch defaults 95 10
### In order to start elasticsearch, execute
 sudo /etc/init.d/elasticsearch start


 

#source /vagrant/makeindex.bat
 

#application
sudo pip install virtualenv 
sudo mkdir /home/apps
sudo chmod 777 /home/apps
sudo chown vagrant /home/apps
cd /home/apps
sudo apt-get -y install git
sudo su vagrant -c 'git clone https://github.com/JohnPickerill/km-prototype-a.git' 
cd km-prototype-a
sudo su vagrant -c 'virtualenv venv' 
sudo su vagrant -c 'venv/bin/pip install -r /vagrant/requirements.pip'

 

#    touch /var/log/vmsetup
fi

sudo service apache2 restart