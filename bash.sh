# !/bin/bash

# update the package repository
dnf update -y

# install apache and php
dnf install httpd php php-mysqlnd -y

# wait for the installation to complete
sleep 60

# start and enable apache
systemctl start httpd
systemctl enable httpd