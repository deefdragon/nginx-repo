#!/bin/bash




echo webhook recieved on $(date) >> /etc/nginx/scripts/test.log
cd /etc/nginx
git pull
sudo service openresty restart && echo RESTARTED OPENRESTY &>> /etc/nginx/scripts/test.log