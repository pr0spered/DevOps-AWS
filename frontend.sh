# !/bin/bash

# update the package repository
sudo dnf update -y

# install apache
sudo dnf install httpd -y

# start and enable apache
sudo systemctl start httpd
sudo systemctl enable httpd