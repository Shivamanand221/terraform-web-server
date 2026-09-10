#!/bin/bash

sudo apt-get update -y

sudo apt-get install nginx -y

sudo systemctl start nginx

sudo systemctl enable nginx

echo "Hello from Terraform 🚀" > /var/www/html/index.html