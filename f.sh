# Illegal selling and redistribution of this script is strictly prohibite
# Please respect author's Property
# Binigay sainyo ng libre, ipamahagi nyo rin ng libre.
#
#

# Get the current IP address of your VPS
IP_ADDRESS=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')


sudo apt-get update && sudo apt-get install squid -y
sleep 3s

cat <<'EOFsquid' > /etc/squid/squid.conf
acl VPN dst 127.0.0.1/32
http_access allow VPN
http_access deny all
http_port 0.0.0.0:8000
http_port 0.0.0.0:8080
acl bonv src 0.0.0.0/0.0.0.0
no_cache deny bonv
dns_nameservers 1.1.1.1 1.0.0.1
visible_hostname localhost
EOFsquid

sed -i "s|127.0.0.1|$IP_ADDRESS|g" /etc/squid/squid.conf && service squid restart && history -c
