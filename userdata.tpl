#!/bin/bash
yum install -y nginx
echo "<html><h1>Hello World</h1></html>" > /usr/share/nginx/html/index.html
systemctl enable nginx
systemctl start nginx