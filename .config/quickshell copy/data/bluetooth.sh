#!/bin/bash

# Get bluetoothctl status
output=$(bluetoothctl show)

# Check conditions in order
if echo "$output" | grep -q "Powered: no"; then 
    echo -n 0 # Bluetooth is off
elif echo "$output" | grep -q "Discovering: yes"; then
    echo -n  2 # Bluetooth is on and discovering
else
    echo -n 1 # Bluetooth is on but not discovering
fi

# Print number of connected devices
echo -n ","
echo -n $(bluetoothctl devices Connected| wc -l)
