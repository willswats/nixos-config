#!/bin/sh

# OPTIONS
# Backup: depending on the platform chosen, trash the directory inside of CLOUD_CONFIG_DEST, then copy the local config dir to the CLOUD_CONFIG_DEST
# Download: depending on the platform chosen, trash the local config dir, then copy the cloud config to the local config dir

# To use this script, change CLOUD_CONFIG_DEST to your desired destination
CLOUD_CONFIG_DEST="$HOME/Dropbox/Games/Backups/"

CONFIG=$HOME/.config/
LOCAL_SHARE=$HOME/.local/share/

RETROARCH_DIR_NAME="retroarch"
YUZU_DIR_NAME="yuzu"
RPCS3_DIR_NAME="rpcs3"

trash_and_copy() {
	if [ -d "$1" ]; then
		trash "$1"
	fi
	cp -r "$2" "$3"
}

backup_or_download() {
	printf "Select an option:"
	printf "\n1. Backup"
	printf "\n2. Download"
	printf "\n"
	read -r option

	if [ "$option" = "1" ]; then
		printf "Backing up..."
		trash_and_copy "${CLOUD_CONFIG_DEST}$1" "$2" "$CLOUD_CONFIG_DEST"
		printf "\nDone!"
	elif [ "$option" = "2" ]; then
		printf "Downloading..."
		trash_and_copy "$2" "${CLOUD_CONFIG_DEST}$1" "$3"
		printf "\nDone!"
	else
		printf "Error: Invalid option"
	fi
}

backup_or_download_to_config() {
	backup_or_download "$1" "${CONFIG}$1" "$CONFIG"
}

backup_or_download_to_local() {
	backup_or_download "$1" "${LOCAL_SHARE}$1" "$LOCAL_SHARE"
}

printf "Select a platform:"
printf "\n1. Retroarch"
printf "\n2. Yuzu"
printf "\n3. RPCS3"
printf "\n"
read -r platform

if [ "$platform" = "1" ]; then
	backup_or_download_to_config "$RETROARCH_DIR_NAME"
elif [ "$platform" = "2" ]; then
	backup_or_download_to_local "$YUZU_DIR_NAME"
elif [ "$platform" = "3" ]; then
	backup_or_download_to_config "$RPCS3_DIR_NAME"
else
	printf "Error: Invalid platform"
fi
