#!/bin/bash
CREDENTIALS=/credentials.txt

find /purevpnconfig -iname "*.ovpn"  -exec cp -v "{}" /etc/openvpn/ \;
find /purevpnconfig -iname "ca.crt"  -exec cp -v "{}" /etc/openvpn/ \;
find /purevpnconfig -iname "Wdc.key" -exec cp -v "{}" /etc/openvpn/ \;
cd /etc/openvpn
chmod 600 Wdc.key ca.crt *.ovpn
echo "Adjusting config files to use the credentials provided..."
sed -i "s~auth-user-pass~auth-user-pass ${CREDENTIALS}~g" *.ovpn
