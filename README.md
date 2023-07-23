# NixOS Config

My NixOS config.

## Table of Contents

- [Installaing NixOS](#installing-nixos)
- [Install nixos-config](#installing-nixos-config)
  - [Connect to Wi-Fi](#connect-to-wi-fi)
  - [Clone the Repository](#clone-the-repository)
  - [Build the Config](#build-the-config)
- [Non-Declarative Setups](#non-declarative-setups)
  - [Utilities (all hosts)](#utilities-all-hosts)
  - [Games (desktop)](#games-desktop)

## Installing NixOS

1. Write the NixOS GNOME ISO to a USB and boot into it.
2. Run the installer and set the following:
   - username and password
   - enable unfree packages
   - erase the disk
   - enable swap with hibernation (desktop and laptop)
   - enable encryption (desktop and laptop)
   - desktop environment: no desktop
3. Reboot the system.

## Installing nixos-config

### Connect to Wi-Fi

To list Wi-Fi access points:

```bash
nmcli dev wifi list
```

To connect to a Wi-Fi access point (replace network-ssid with the name of the network and network-password with the password of the network):

```bash
sudo nmcli dev wifi connect network-ssid password "network-password"
```

### Clone the Repository

Enter a nix-shell with git:

```bash
nix-shell -p git
```

Clone the repository:

```bash
git clone https://github.com/willswats/nixos-config.git
```

### Build the Config

CD into the cloned repository and run (replace host-name with the desired host name):

```bash
sudo nixos-rebuild switch --flake .#host-name
```

Note to self: once you are logged in with SSH, clone the repository with SSH into `~/Code` and delete the old clone.

## Non-Declarative Setups

### Utilities (all hosts)

1. [Firefox](./docs/utilities/firefox.md)
2. [SSH](./docs/utilities/ssh.md)
3. [rclone](./docs/utilities/rclone.md)

### Games (desktop)

1. [steam](./docs/games/steam.md)
1. [Slippi](./docs/games/slippi.md)
1. [RetroArch](./docs/games/retroarch.md)
1. [Yuzu](.edocs/games/yuzu.md)
