mkdir /srv/kozos
chmod 777 /srv/kozos

mkdir /srv/kozos2
chmod 755 /srv/kozos

apt-get install samba -y
nano /etc/samba/smb.conf

echo "

[global]
netbios
name=ubuntu-szerver
security=user map to guest=bad user
workgroup = WORKGROUP
public=yes

[kozos]
comment=nyilvános írható-olvasható megosztás 
path=/srv/kozos
writeable=yes
read only=no
browseable=yes
guest ok=yes
public=yes 

[kozos2] 
comment=nyilvános csak olvasható megosztás
path=/srv/kozos2
read only=yes
browseable=yes 
guest=ok 
public=yes" >> /etc/samba/smb.conf

service smbd restart
service smbd status
testparm

useradd user2 –c „User2” –g users –m –d /home/user2 –s /bin/bash
passwd user2 

mkdir /srv/user2
chown user2 /srv/user2
chmod 700 /srv/user2

nano /etc/samba/smb.conf

echo "[user2]
comment=írható-olvasható megosztás a user2 felhasználónak
path=/srv/user2
writeable=yes
browseable=no 
public=no 
read list=user2 
writelist=user2 
force directory mode=0777 
force create mode=0777
" >> /etc/samba/smb.conf

smbpasswd -a User2,

service smbd restart
service smbd status
testparm
