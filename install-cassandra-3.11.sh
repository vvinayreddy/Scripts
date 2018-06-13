#!/bin/bash

useradd cassandra
echo "cassandra ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/cassandra && chmod 0440 /etc/sudoers.d/cassandra
usermod -aG cassandra cassandra
yum install wget net-tools -y

echo "installing java"

# install java with rpm
cd /opt
wget --no-cookies --no-check-certificate --header "Cookie:oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.rpm"
yum localinstall jdk-8u171-linux-x64.rpm -y 
rm -rf /opt/jdk-8u171-linux-x64.rpm

echo " java installation compeleted"

cd /opt 
wget http://apache.claz.org/cassandra/3.11.2/apache-cassandra-3.11.2-bin.tar.gz 
tar xvzf apache-cassandra-3.11.2-bin.tar.gz 
rm -rf /opt/apache-cassandra-3.11.2-bin.tar.gz
chown -R cassandra:cassandra apache-cassandra-3.11.2
mv apache-cassandra-3.11.2 cassandra

echo "cassandra installation sucess"
