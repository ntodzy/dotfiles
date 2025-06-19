#!/bin/sh
echo $(nmcli -t -f active,ssid,signal dev wifi | grep '^yes' | cut -d: -f2-)
echo $(nmcli r wifi | grep -o 'enabled\|disabled')