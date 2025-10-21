#!/bin/bash

# update the package repository
dnf update -y

# install mysql
dnf install -y mariadb105