#!/bin/bash

for i in 0 1 2 3 4 5 6 7 8 9 
do
for j in 0 1 2 3 4 5 6 7 8 9
do
sudo touch /home/user$i/c.txt
sudo cat <<EOF >>c.txt
21 15 * * 1-6 head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10 > /home/user$i/delta/folder$j/final.txt 
EOF
sudo crontab -u user$i c.txt
done
done
