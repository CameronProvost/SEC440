#!/bin/bash

# Prompt user for IP network prefix and port number
read -p "Enter the IP network prefix  " network_prefix
read -p "Enter the port number to scan  " port

# Loop through IPs in the range from 1 to 254
for i in {1..254}; do
    host="$network_prefix.$i"
    timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
      echo "$host,$port"
done
