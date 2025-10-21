#!/bin/bash

# update the package repository
dnf update -y

# install mysql
dnf install -y mariadb105

# make a directory to store database files
mkdir -p /home/ec2-user/database

# sync the S3 bucket database contents
aws s3 sync s3://${s3_bucket}/database/ /home/ec2-user/database/ --delete

# creates a database in the RDS instance
mysql -h "${db_endpoint}" -P 3306 -u admin -p12345678 -e "CREATE DATABASE \`ecomm-data\`;"

# import the sql file to the database
mysql -h "${db_endpoint}" -P 3306 -u admin -p12345678 ecomm-data < /home/ec2-user/database/shopee.sql