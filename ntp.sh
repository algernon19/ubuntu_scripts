# update repository and install ntp
sudo apt update
sudo apt install ntp

# check config file
cat /etc/ntp.conf

# add ntp servers
echo server 0.europe.pool.ntp.org >> /etc/ntp.conf
echo server 1.europe.pool.ntp.org >> /etc/ntp.conf
echo server 2.europe.pool.ntp.org >> /etc/ntp.conf
echo server 3.europe.pool.ntp.org >> /etc/ntp.conf

# check config file
sudo nano /etc/ntp.conf

# restart ntp service
sudo systemctl restart ntp
# check status
sudo systemctl status ntp