---
title: 'Basic iptables configuration'
---
```
*filter
#  Allow all loopback (lo0) traffic and drop all traffic to 127/8 that doesn't use lo0
-A INPUT -i lo -j ACCEPT
-A INPUT -d 127.0.0.0/8 -j REJECT

#  Accept all established inbound connections
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#  Allow all outbound traffic - you can modify this to only allow certain traffic
-A OUTPUT -j ACCEPT

#  Allow HTTP and HTTPS connections from anywhere (the normal ports for websites and SSL).
-A INPUT -p tcp --dport 80 -j ACCEPT
-A INPUT -p tcp --dport 443 -j ACCEPT

#  Allow SSH connections
-A INPUT -p tcp -m state --state NEW --dport 22 -j ACCEPT

# Allow connections to postgresql
-A INPUT -p tcp --dport 5432 -j ACCEPT

# Allow connections to openvpn
-A INPUT -p udp --dport 1194 -j ACCEPT
-A INPUT -p tcp --dport 1194 -j ACCEPT

#  Allow ping
-A INPUT -p icmp --icmp-type echo-request -j ACCEPT

#  Limit connections
-A INPUT -p tcp --syn --dport 22 -m connlimit --connlimit-above 5 -j REJECT --reject-with tcp-reset
-A INPUT -p tcp --syn --dport 1194 -m connlimit --connlimit-above 5 -j REJECT --reject-with tcp-reset
-A INPUT -p tcp --syn --dport 80 -m connlimit --connlimit-above 30 -j REJECT --reject-with tcp-reset
-A INPUT -p tcp --syn --dport 443 -m connlimit --connlimit-above 30 -j REJECT --reject-with tcp-reset

#  Log iptables denied calls
-A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

#  Drop all other inbound - default deny unless explicitly allowed policy
-A INPUT -j DROP
-A FORWARD -j DROP

COMMIT
```
