[root@rhel8test DEV]# cat ipv6.firewall.sh

#!/bin/bash
# Flush ip6tables  rules
ip6tables  -F

# Ensure default deny firewall policy
ip6tables  -P INPUT DROP
ip6tables  -P OUTPUT DROP
ip6tables  -P FORWARD DROP

# Ensure loopback traffic is configured
ip6tables  -A INPUT -i lo -j ACCEPT
ip6tables  -A OUTPUT -o lo -j ACCEPT
ip6tables  -A INPUT -s ::1 -j DROP

# Ensure outbound and established connections are configured

ip6tables  -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT
ip6tables  -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT
ip6tables  -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT
ip6tables  -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT
ip6tables  -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT
ip6tables  -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT

# Open inbound ssh(tcp port 22) connections

ip6tables  -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT
[root@rhel8test DEV]#
