#!/bin/bash




echo webhook recieved on $(date) >> /etc/nginx/scripts/test.log
cd /etc/nginx
git pull
sudo service openresty restart &>> /etc/nginx/scripts/test.log & 
echo RESTARTED OPENRESTY &>> /etc/nginx/scripts/test.log