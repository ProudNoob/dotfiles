#!/bin/bash

# Options for the power menu
options="Shutdown Reboot Lock Logout"

# Display the menu and capture the selected option
chosen=$(echo "$options" | tr ' ' '\n' | dmenu \
    -p "Power Menu:" \
    -fn "Iosevka Nerd Font-18" \
    -i \
    -nb "#1e1e2e" -nf "#cdd6f4" \
    -sb "#89b4fa" -sf "#1e1e2e")

# Perform the action based on the selection
case "$chosen" in
    Shutdown) systemctl poweroff ;;
    Reboot) systemctl reboot ;;
    Lock) loginctl lock-session ;;
    Logout) i3-msg exit ;;
    *) exit 1 ;; # Exit if no valid option was chosen
esac

