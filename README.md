# DevOps-AWS

## Overview

This is a demo project showcasing a 3-tier architecture deployment on AWS using Terraform.  
It provisions and configures a highly scalable, secure and available environment to host a PHP-based eCommerce application that sells mobile phones.  

---

## Architecture

This project implements a 3-Tier AWS Architecture

### Components

#### 1. **Presentation Tier**
- Publicly accessible layer with an External Application Load Balancer (ALB).
- Deployed across two public subnets (in separate Availability Zones).
- Auto Scaling Group (ASG) launches EC2 instances.
- Bastion Host in the public subnet allows secure SSH access to private instances and database.
- Security group (`ecomm-sec-alb-fe`, `ecomm-sec-fe`) permits HTTP/HTTPS traffic from the internet.

#### 2. **Application Tier**
- Private layer hosting the PHP application logic behind an Internal Application Load Balancer (ALB).
- Deployed across two private subnets for high availability.
- Auto Scaling Group (ASG) launches EC2 instances, connected via NAT Gateway for outbound internet access.
- EC2 instances retrieve and sync website files from Amazon S3.
- Security group (`ecomm-sec-alb-be`, `ecomm-sec-be`) allows inbound traffic only from the Frontend.

#### 3. **Data Tier**
- Managed Amazon RDS (MySQL) with Multi-AZ deployment for durability.
- Deployed in private subnets isolated from the public internet.
- Security group (`ecomm-sec-db`) allows inbound traffic only from the Application Tier and Bastion Host.
- Includes a **read replica** for load distribution and high availability.

#### Networking
- Single VPC (10.0.0.0/16) with multiple public and private subnets across two Availability Zones.
- Internet Gateway (IGW) enables public connectivity.
- NAT Gateway provides secure outbound internet access for private subnets.
- Route Tables and Security Groups configured for tier isolation and controlled access.

---

## Infrastructure as Code (Terraform)

Terraform is used to define, provision, and manage all AWS resources in this project.

- AWS infrastructure setup using Terraform.
- Automated provisioning of networking, presentation, application, and database layers.

---

## E-Commerce

The eCommerce site serves as a simple application to be deployed on AWS with basic functionalities — home page with products, user login/registration, and a shopping cart.