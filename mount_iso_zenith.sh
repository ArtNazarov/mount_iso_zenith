#!/bin/bash

# Use zenity to prompt user to choose an ISO file
ISO_FILE=$(zenity --file-selection --title="Select ISO File" --file-filter="IS/hdd3/.cache/yay/qt5-webkit/src/qtwebkit-5.212.0-alpha4/Source/WTF/wtf/text/StO files | *.iso")

# Check if user selected a file
if [ -z "$ISO_FILE" ]; then
  zenity --error --text="No ISO file selected. Exiting."
  exit 1
fi

# Create mount point directory if it doesn't exist
if [ ! -d /mnt/iso ]; then
  sudo mkdir -p /mnt/iso
fi

# Mount the selected ISO to /mnt/iso
sudo mount -o loop "$ISO_FILE" /mnt/iso

# Check if mount was successful
if mountpoint -q /mnt/iso; then
  zenity --info --text="ISO mounted successfully at /mnt/iso"
else
  zenity --error --text="Failed to mount ISO."
fi
