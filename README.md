# VNC Auto-Connect Script for macOS

This repository contains a Bash script that automatically connects to a VNC server on macOS using a password stored securely in the macOS Keychain.

## Features

- Automatically connects to a VNC server using the built-in Screen Sharing app on macOS
- Stores the VNC password securely in the macOS Keychain
- Prompts the user to create a new Keychain entry for the VNC password if it does not exist

## Prerequisites

- macOS with the built-in Screen Sharing app
- A VNC server to connect to

## Usage

1. Clone this repository or download the `auto_connect_vnc_keychain_create.sh` script.
2. Make the script executable:

```chmod +x auto_connect_vnc_keychain_create.sh```

3. Edit the script and set the following variables:

- `VNC_SERVER_ADDRESS`: The IP address or hostname of your VNC server
- `VNC_SERVER_PORT`: The port number of your VNC server (usually 5900)
- `KEYCHAIN_SERVICE`: The Keychain service name for your VNC password (e.g., "VNC_Password")
- `KEYCHAIN_ACCOUNT`: The Keychain account name for your VNC password (e.g., "your_keychain_account_name")

4. Run the script:

```./auto_connect_vnc_keychain_create.sh```


If the VNC password is not already stored in the Keychain, the script will prompt you to enter a new password, which will be securely stored in the Keychain.

5. The script will automatically connect to the specified VNC server using the built-in Screen Sharing app on macOS.

## Security Considerations

This script retrieves the VNC password from the macOS Keychain, providing a more secure way to store and use the password compared to storing it as plain text in the script. However, it is still important to protect your Keychain and VNC server with strong passwords and appropriate access controls.

