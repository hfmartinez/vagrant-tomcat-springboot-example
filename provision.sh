#!/bin/bash

# Update and install basic packages
sudo apt-get update
sudo apt-get install -y openjdk-17-jdk wget git

# Create tomcat user if it doesn't exist
if ! id "tomcat" &>/dev/null; then
    sudo useradd -r -s /bin/false tomcat
fi

# Install Apache Tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.tar.gz
sudo tar xzf apache-tomcat-9.0.102.tar.gz -C /opt
sudo ln -s /opt/apache-tomcat-9.0.102 /opt/tomcat
sudo chown -R tomcat:tomcat /opt/apache-tomcat-9.0.102

# Set environment variables for Tomcat
echo 'export CATALINA_HOME=/opt/tomcat' | sudo tee -a /etc/profile
echo 'export PATH=${CATALINA_HOME}/bin:${PATH}' | sudo tee -a /etc/profile
source /etc/profile

# Download and install Maven
wget https://archive.apache.org/dist/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
sudo tar xzf apache-maven-3.8.5-bin.tar.gz -C /opt
sudo ln -s /opt/apache-maven-3.8.5 /opt/maven
echo 'export M2_HOME=/opt/maven' | sudo tee -a /etc/profile
echo 'export PATH=${M2_HOME}/bin:${PATH}' | sudo tee -a /etc/profile
source /etc/profile

# Navigate to the directory where the Spring Boot application source code is located
cd /vagrant/spring-boot-app

# Package the Spring Boot application as a WAR file
mvn clean package

# Deploy the WAR file to Tomcat
sudo cp target/app.war /opt/tomcat/webapps/
sudo chown tomcat:tomcat /opt/tomcat/webapps/app.war

# Start Tomcat
sudo -u tomcat /opt/tomcat/bin/startup.sh

