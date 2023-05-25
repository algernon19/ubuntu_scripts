# Desc: update repository
apt-get update -y
# Desc: Install DHCP server
apt-get install isc-dhcp-server-y
# Desc: restart DHCP service
systemctl restart isc-dhcp-server.service
# Desc: check status
systemctl status isc-dhcp-server.service
# Desc: check config file
nano /etc/dhcp/dhcpd.conf
# Desc: add DHCP server to startup
systemctl enable isc-dhcp-server.service

# authoritative;
# ddns-update-style none;
option domain-name-servers 192.168.1.1;
option broadcast-address 192.168.1.255;
option routers 192.168.1.1;
option subnet-mask 255.255.255.0;
default-lease-time 600;
max-lease-time 7200;
 subnet 192.168.1.0 netmask 255.255.255.0{
    range 192.168.1.10 192.168.1.100;}
# MAC cím alapján IP-cím kiosztása a kliens gépnek:host kliens1{ hardware ethernet 00:AA:BB:CC:DD:EE;fixed-address 192.168.1.101;option host-name kliens1;}