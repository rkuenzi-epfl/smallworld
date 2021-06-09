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

# Copy service file
cp ./smallworld.service /lib/systemd/system/

# Systemd new service lookup
systemctl daemon-reload

# Systemd service enable (start on boot)
systemctl enable smallworld.service
