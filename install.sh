#!/bin/sh

# Set as executable
chmod +x ./smallworld
chmod +x ./smallworldForwardEvent

# Create conf folder and copy conf
mkdir /etc/smallworld
cp ./exampleConfigurations/wpa_AP.conf /etc/smallworld/
cp ./exampleConfigurations/wpa_noAP.conf /etc/smallworld/

# Copy smallworld executables
cp ./smallworld /usr/sbin/
cp ./smallworldForwardEvent /usr/sbin/

# Copy AP and DHCP conf files
cp ./exampleConfigurations/hostapd.conf /etc/hostapd/hostapd.conf
cp ./exampleConfigurations/hostapd.psk /etc/hostapd/hostapd.psk
cp ./exampleConfigurations/dnsmasq.conf /etc/dnsmasq.conf
cp ./exampleConfigurations/dhcpcd.conf /etc/dhcpcd.conf

# Copy service file
cp ./smallworld.service /lib/systemd/system/

# Systemd new service lookup
systemctl daemon-reload

# Systemd service enable (start on boot)
systemctl enable smallworld.service
