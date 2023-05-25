apt-get update
apt-get install nfs-kernel-server -y
mkdir /srv/megosztott
chmod 777 /srv/megosztott
nano /etc/exports
# /srv/megosztott 192.168.1.0/24(rw,sync,root_squash,no_subtree_check)
systemctl restart nfs-kernel-server
systemctl enable nfs-kernel-server


# client
apt-get update
apt-get install nfs-common –y
mkdir /mnt/megosztas
mount -t nfs 192.168.1.2:/srv/megosztott /mnt/megosztas
umount /mnt/megosztas
# /etc/fstab 
# -> 192.168.1.2:/srv/megosztott /mnt/megosztasnfs rw,hard,intr 0 0 
