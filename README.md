# NixOS Config

My NixOS config.

## Table of Contents

- [Installing NixOS](#installing-nixos)
- [Install nixos-config](#installing-nixos-config)
  - [Connect to Wi-Fi](#connect-to-wi-fi)
  - [Clone the Repository](#clone-the-repository)
  - [Build the Config](#build-the-config)
- [Non-Declarative Setups](#non-declarative-setups)
  - [Utilities (all hosts)](#utilities-all-hosts)
  - [Games (desktop)](#games-desktop)

## Installing NixOS

1. Get the latest NixOS GNOME ISO from [here](https://releases.nixos.org/?prefix=nixos/unstable/).
2. Write the NixOS GNOME ISO to a USB and boot into it.
3. Run the installer and set the following:
   - Username and password
   - Use the same password for the administrator account
   - Desktop: No desktop
   - Allow unfree packages
   - Erase the disk
   - Enable swap with hibernation (desktop and laptop)
   - Enable encryption (desktop and laptop)
4. Reboot the system.

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

Enter a nix-shell with git and neovim:

```bash
nix-shell -p git nvim
```

Clone the repository to `~/Code/nixos-config`:

```bash
mkdir ~/Code
git clone https://github.com/willswats/nixos-config.git ~/Code/nixos-config
```

### Add hardware-configuration.nix

Add the `hardware-configuration.nix` to your chosen host (replace host-name with the desired host):

```bash
cp /etc/nixos/hardware-configuration.nix ~/Code/nixos-config/hosts/host-name/
```

### Add boot.initrd.luks.devices Information (desktop & laptop)

Copy the text that starts with `boot.initrd.luks.devices` from `/etc/nixos/configuration.nix` to `~/Code/nixos-config/hosts/host-name/default.nix`, with `host-name` being your desired host.

### Build the Config

Remove the `.git` directory (otherwise the build is based off of git):

```bash
rm -rf ~/Code/nixos-config/.git
```

Run (replace host-name with the desired host name):

```bash
sudo nixos-rebuild switch --flake .#host-name
```

Reboot the system:

```bash
reboot
```

### Note to Self

Once you are logged in to GitHub with SSH, run the following and then commit the changes:

```bash
git clone git@github.com:willswats/nixos-config.git ~/nixos-config-temp
cp -r ~/nixos-config-temp/.git ~/Code/nixos-config
rm -rf ~/nixos-config-temp
```

## Non-Declarative Setups

### Utilities (all hosts)

1. [Firefox](./docs/utilities/firefox.md)
2. [SSH](./docs/utilities/ssh.md)
3. [virt-manager](./dosc/utilities/virt-manager)
4. [rclone](./docs/utilities/rclone.md)

### Games (desktop)

1. [steam](./docs/games/steam.md)
1. [Slippi](./docs/games/slippi.md)
1. [RetroArch](./docs/games/retroarch.md)
1. [Yuzu](.edocs/games/yuzu.md)
