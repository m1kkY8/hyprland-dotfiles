#!/bin/bash
# Detect the tun interface dynamically
tun_interface=$(ip -o -4 addr show | grep tun | awk '{print $2}')

if [ -n "$tun_interface" ]; then
  # If tun interface exists, display its IP
  ip -o -4 addr show "$tun_interface" | awk '{print $4}' | cut -d'/' -f1
else
  # If no tun interface, VPN is not connected
  echo "No VPN"
fi
