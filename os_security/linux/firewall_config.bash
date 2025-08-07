#!/bin/bash
# 1. Allow HTTPS (port 443)
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" port port="443" protocol="tcp" accept'
firewall-cmd --permanent --add-rich-rule='rule family="ipv6" port port="443" protocol="tcp" accept'	

# 2. Reject all other IPv4,ipv6 traffic - Explicit Deny
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" log prefix="firewalld-drop " level="info" reject'
firewall-cmd --permanent --add-rich-rule='rule family="ipv6" log prefix="firewalld-drop " level="info" reject'

# 3. Reload firewall
firewall-cmd --reload