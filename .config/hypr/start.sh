#!/usr/bin/env bash
swww init & 
wireplumber &
# add restart to services
systemctl --user restart pipewire.service
systemctl --user restart pipewire-pulse.service
waybar &
dunst