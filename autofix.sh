#!/bin/bash
# Laravel Installer
# Script by Juan
# 
# Illegal selling and redistribution of this script is strictly prohibited
# Please respect author's Property
# Binigay sainyo ng libre, ipamahagi nyo rin ng libre.
#
#

# Fixing Squid Proxy



apt-get -y install squid
function fixsquid() {
    cat <<'EOFsquid' > /etc/squid/squid.conf
acl VPN dst $IP_ADDRESS/32
http_access allow VPN
http_access deny all
http_port 0.0.0.0:8000
http_port 0.0.0.0:8080
acl bonv src 0.0.0.0/0.0.0.0
no_cache deny bonv
dns_nameservers 1.1.1.1 1.0.0.1
visible_hostname localhost
EOFsquid

}
fixsquid

function fixedovpn() {
bash -c "sed -i "/ncp-disable/d" /etc/openvpn/server/*.conf;systemctl restart openvpn-server@{ec_s,s}erver_{tc,ud}p"
}
fixedovpn


BOT_TOKEN="5812011290:AAFc1py9CQ1eY_gULz6Vhkxv5OvfuSN8ZTw"

# The chat ID of the conversation with your Telegram bot
CHAT_ID="-1001793667487"

# The URL to send the message to your Telegram bot
URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage"

# Get the current IP address of your VPS
IP_ADDRESS=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')

# Forward the IP address to the Telegram bot
curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="Your VPS IP address is: $IP_ADDRESS"

service squid restart
service openvpn restart
history -c
clear




echo "THIS SCRIPT IS NOT FOR SALE "
echo "OPENVPN AND SQUID PROXY FIXED "
echo "MICROSSH.COM "