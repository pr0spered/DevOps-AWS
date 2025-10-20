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
aws s3 sync s3://val-01 /var/www/html --delete

# set proper permissions for Apache web root
chmod -R 755 /var/www/html

# restart apache to apply changes
systemctl restart httpd