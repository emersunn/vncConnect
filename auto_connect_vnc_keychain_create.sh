#!/bin/bash

# Script to auto connect to a VNC server on macOS using password stored in the Keychain

# Set your VNC server address and port
VNC_SERVER_ADDRESS="192.168.1.10"
VNC_SERVER_PORT="5900"

# Set the keychain service and account names for your VNC password
KEYCHAIN_SERVICE="VNC_Password"
KEYCHAIN_ACCOUNT="your_keychain_account_name"

# Check if the VNC password exists in the keychain
VNC_PASSWORD_EXISTS=$(security find-generic-password -s "$KEYCHAIN_SERVICE" -a "$KEYCHAIN_ACCOUNT" 2>/dev/null)

# If the VNC password does not exist, prompt the user to create a new entry
if [ -z "$VNC_PASSWORD_EXISTS" ]; then
  echo "The VNC password for account '$KEYCHAIN_ACCOUNT' in service '$KEYCHAIN_SERVICE' does not exist."
  read -sp "Enter a new VNC password to store in the Keychain: " NEW_VNC_PASSWORD
  security add-generic-password -s "$KEYCHAIN_SERVICE" -a "$KEYCHAIN_ACCOUNT" -w "$NEW_VNC_PASSWORD"
  echo "The VNC password has been stored in the Keychain."
fi

# Get the VNC password from the keychain
VNC_PASSWORD=$(security find-generic-password -s "$KEYCHAIN_SERVICE" -a "$KEYCHAIN_ACCOUNT" -w)

# Generate a temporary password file
VNC_PASSWORD_FILE=$(mktemp)
chmod 600 $VNC_PASSWORD_FILE
echo $VNC_PASSWORD > $VNC_PASSWORD_FILE

# Auto connect to the VNC server using the built-in Screen Sharing app
open "vnc://$VNC_SERVER_ADDRESS:$VNC_SERVER_PORT" -F -n -W --args -FullScreen -VNCPasswordFile "$VNC_PASSWORD_FILE"

# Clean up the temporary password file
rm -f $VNC_PASSWORD_FILE
