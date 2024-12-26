#!/bin/bash


#########################################################
# Prepare installation
#########################################################
set -e
# Function to handle errors
error_handler() {
    echo "::: Error occurred in script at line: $1"
    exit 1
}
# Trap errors and call the error handler
trap 'error_handler $LINENO' ERR


#########################################################
# Ask if user want to update installer
#########################################################
echo -e "\e[35m::: Do you want to update this repo (installer) before installing?\e[0m (y/n): \c"
read update
if [[ "$update" == "y" || "$update" == "Y" ]]; then
    echo "::: Updating..."
    git pull
    echo "::: Restarting script..."
    exec "$0"
else
    echo "::: Continue without updating."
fi
























#########################################################
# Default apps
#########################################################
echo "::: Applying default apps..."
XDG_MENU_PREFIX=arch- kbuildsycoca6
# # Video
# xdg-mime default mpv.desktop video/mp4
# xdg-mime default mpv.desktop video/x-matroska
# xdg-mime default mpv.desktop video/webm
# # Pics
# xdg-mime default imv.desktop image/jpeg
# xdg-mime default imv.desktop image/png
# xdg-mime default imv.desktop image/gif
# echo "::: Done."








#########################################################
# Bluetooth
#########################################################

echo -e "\e[35m::: Do you want to enable Bluetooth service?\e[0m (y/n): \c"
read bluetooth
if [[ "$bluetooth" == "y" || "$bluetooth" == "Y" ]]; then
    echo "::: Enabling Bluetooth service..."
    sudo systemctl enable bluetooth.service
    sudo systemctl restart bluetooth.service
else
    echo "::: Cancelled by user."
fi

#########################################################
# Done
#########################################################

echo -e "\e[35m::: Well done.\e[0m"
echo -e "\e[35m::: Now please type 'reboot'.\e[0m"
echo -e "\e[35m::: After login use 'win+z' top open Terminal.\e[0m"
echo -e "\e[35m::: Type 'hyprnez keys' to see default keybinds.\e[0m"
echo -e "\e[35m::: Type 'hyprnez' to see all commands.\e[0m"
echo -e "\e[35m::: Type 'hyprnez config' to edit main config.\e[0m"
