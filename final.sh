
#!/bin/bash

for i in 0 1 2 3 4 5 6 7 8 9
do 
sudo useradd -m -d /home/user$i user$i
sudo mkdir /home/user$i/delta
sudo chown user$i /home/user$i/delta
sudo chmod u+rwx,g+rwx,o-rwx /home/user$i/delta
if [ $i -lt 4 ];
then
sudo groupadd admin1
sudo usermod -a -G admin1 user$i
sudo groupadd moder1
sudo usermod -a -G moder1 user$i
elif [ $i -gt 3 -a $i -lt 7 ]
then
sudo usermod -a -G moder1 user$i
sudo chgrp admin1 /home/user$i/delta
else
sudo chgrp moder1 /home/user$i/delta
fi
sudo chmod u+rwx,g-rwx /home/user0/delta
for j in 0 1 2 3 4 5 6 7 8 9
do
sudo mkdir /home/user$i/delta/folder$j
sudo touch /home/user$i/delta/folder$j/final.txt
sudo head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10 > /home/user$i/delta/folder$j/final.txt
done

done
for i in 1 2 3
do
sudo chgrp user0 /home/user$i/delta

done

