# NixOS Config

My NixOS config.

## Table of Contents

- [Installing NixOS](#installing-nixos)
- [Install nixos-config](#installing-nixos-config)
  - [Clone the Repository](#clone-the-repository)
  - [Build the Config](#build-the-config)
- [Non-Declarative Setups](#non-declarative-setups)
  - [Utilities (all hosts)](#utilities-all-hosts)
  - [Games (desktop)](#games-desktop)

## Installing NixOS

1. Download the NixOS Plasma ISO from [here](https://nixos.org/download.html).
2. Write the NixOS Plasma ISO to a USB and boot into it.
3. Run the installer and set the following:
   - Username and password
   - Use the same password for the administrator account
   - Desktop: Plasma
   - Allow unfree packages
   - Erase the disk
   - Enable swap with hibernation (desktop and laptop)
   - Enable encryption (desktop and laptop)
4. Reboot the system.

## Installing nixos-config

### Clone the Repository

Enter a nix-shell with git and neovim:

```bash
nix-shell -p git neovim
```

Clone the repository to `~/Code/nixos-config`:

```bash
mkdir ~/Code
git clone https://github.com/willswats/nixos-config.git ~/Code/nixos-config
```

### Add hardware-configuration.nix

Add the `hardware-configuration.nix` to your chosen host (replace `host` with the desired host):

```bash
cp /etc/nixos/hardware-configuration.nix ~/Code/nixos-config/hosts/host/
```

### Add boot.initrd.luks.devices Information (desktop & laptop)

Copy the text that starts with `boot.initrd.luks.devices` from `/etc/nixos/configuration.nix` to `~/Code/nixos-config/hosts/host/default.nix`, with `host` being your desired host.

### Build the Config

CD to the directory:

```bash
cd ~/Code/nixos-config
```

Remove the `.git` directory (otherwise the build is based off of git):

```bash
rm -rf ./.git
```

Run (replace `host` with your desired host):

```bash
sudo nixos-rebuild switch --flake .#host
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

### Utilities

1. [Firefox](./docs/utilities/firefox.md)
2. [SSH](./docs/utilities/ssh.md)
3. [virt-manager](./dosc/utilities/virt-manager)
4. [rclone](./docs/utilities/rclone.md)

### Games

1. [steam](./docs/games/steam/steam.md)
2. [CSGO](./docs/games/steam/csgo.md)
3. [TF2](./docs/games/steam/tf2.md)
4. [DS3](./docs/games/steam/tf2.md)
5. [osu](./docs/games/osu.md)
6. [Slippi](./docs/games/slippi.md)
7. [RetroArch](./docs/games/retroarch.md)
8. [Yuzu](./docs/games/yuzu.md)
