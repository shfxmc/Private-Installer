# Illegal selling and redistribution of this script is strictly prohibite
# Please respect author's Property
# Binigay sainyo ng libre, ipamahagi nyo rin ng libre.
#
#

# Install AutoScript
function ssh() {
    rm -f UbuntuVPS* && wget -q 'https://raw.githubusercontent.com/Bonveio/BonvScripts/master/UbuntuVPS-Installer' && chmod +x UbuntuVPS-Installer && ./UbuntuVPS-Installer
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



function antitorrent() {
iptables -A OUTPUT -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
iptables -A INPUT -f -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
iptables -A INPUT -m string --string "BitTorrent" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "BitTorrent protocol" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "peer_id=" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string ".torrent" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "announce.php?passkey=" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "torrent" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "announce" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "info_hash" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "peer_id" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "BitTorrent" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "BitTorrent protocol" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "bittorrent-announce" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "announce.php?passkey=" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "find_node" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "info_hash" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "get_peers" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "announce" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "announce_peers" --algo kmp --to 65535 -j DROP
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -I OUTPUT -p tcp --dport 1723 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 6881:6889 -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -p tcp --dport 6881:6889 -j DROP
iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "peer_id=" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string ".torrent" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j LOGDROP iptables -D FORWARD -m string --algo bm --string "torrent" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "announce" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "info_hash" -j LOGDROP
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j LOGDROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j LOGDROP
iptables -A FORWARD -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "tracker" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "tracker" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "tracker" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "tracker" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "tracker" -j DROP
iptables -D INPUT -m string --algo bm --string "BitTorrent" -j DROP
iptables -D INPUT -m string --algo bm --string "BitTorrent protocol" -j DROP iptables -D INPUT -m string --algo bm --string "peer_id=" -j DROP
iptables -D INPUT -m string --algo bm --string ".torrent" -j DROP
iptables -D INPUT -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -D INPUT -m string --algo bm --string "torrent" -j DROP
iptables -D INPUT -m string --algo bm --string "announce" -j DROP
iptables -D INPUT -m string --algo bm --string "info_hash" -j DROP
iptables -D INPUT -m string --algo bm --string "tracker" -j DROP
iptables -D OUTPUT -m string --algo bm --string "BitTorrent" -j DROP
iptables -D OUTPUT -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -D OUTPUT -m string --algo bm --string "peer_id=" -j DROP
iptables -D OUTPUT -m string --algo bm --string ".torrent" -j DROP
iptables -D OUTPUT -m string --algo bm --string "announce.php?passkey=" -j DROP iptables -D OUTPUT -m string --algo bm --string "torrent" -j DROP
iptables -D OUTPUT -m string --algo bm --string "announce" -j DROP
iptables -D OUTPUT -m string --algo bm --string "info_hash" -j DROP
iptables -D OUTPUT -m string --algo bm --string "tracker" -j DROP
iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP iptables -D FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -D FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP iptables -D FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -D FORWARD -m string --algo bm --string "announce" -j DROP
iptables -D FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables -D FORWARD -m string --algo bm --string "tracker" -j DROP
iptables-save
}
antitorrent


function remove() {
echo "" > .bash_history 
echo '' > /var/log/syslog
}
remove

sleep 2s
rm /etc/crontab
rm /etc/crontab

sleep 2s

history -c
clear




echo "MICROSSH AUTO SCRIPT "
