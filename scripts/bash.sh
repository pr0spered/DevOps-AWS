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

# sync the S3 bucket contents (website files) to Apache web root
aws s3 sync s3://${s3_bucket} /var/www/html --delete

# set proper permissions for Apache web root
chmod -R 755 /var/www/html

# insert database endpoint as hostname in DBController.php
sed -i "s|<host>|${db_endpoint}|" /var/www/html/database/DBController.php

# restart apache to apply changes
systemctl restart httpd