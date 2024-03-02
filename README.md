# NixOS Config

My NixOS config.

## Table of Contents

<!--toc:start-->

- [Installing NixOS](#installing-nixos)
- [Installing nixos-config](#installing-nixos-config)
  - [Connect to Wi-Fi (desktop and laptop)](#connect-to-wi-fi-desktop-and-laptop)
  - [Clone the Repository](#clone-the-repository)
  - [Add hardware-configuration.nix](#add-hardware-configurationnix)
  - [Add boot.initrd.luks.devices Information (desktop and laptop)](#add-bootinitrdluksdevices-information-desktop-and-laptop)
  - [Build the Config](#build-the-config)
- [Post-installation](#post-installation)
  - [Add the nixos-unstable Channel](#add-the-nixos-unstable-channel)
  - [Delete Bash History (desktop and laptop)](#delete-bash-history-desktop-and-laptop)
- [Non-Declarative Setups](#non-declarative-setups) - [Utilities](#utilities) - [Games](#games)
<!--toc:end-->

## Installing NixOS

1. Download the NixOS Plasma ISO from [here](https://nixos.org/download.html).
2. Write the NixOS Plasma ISO to a USB and boot into it.
3. Run the installer and set the following:
   - Language
   - Username and password
   - Use the same password for the administrator account
   - Desktop: No desktop
   - Allow unfree packages
   - Erase the disk
   - Enable swap (virtual)
   - Enable swap with hibernation (desktop and laptop)
   - Enable encryption (desktop and laptop)
4. Reboot the system.

## Installing nixos-config

### Connect to Wi-Fi (desktop and laptop)

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
nix-shell -p git neovim
```

Clone the repository to `~/Code/nixos-config`:

```bash
git clone https://github.com/willswats/nixos-config.git ~/Code/nixos-config
```

### Add hardware-configuration.nix

Add the `hardware-configuration.nix` to your chosen host (replace `host` with the desired host):

```bash
cp /etc/nixos/hardware-configuration.nix ~/Code/nixos-config/hosts/host/
```

### Add boot.initrd.luks.devices Information (desktop and laptop)

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
sudo nixos-rebuild boot --flake .#host
```

Reboot the system:

```bash
reboot
```

## Post-installation

### Add the nixos-unstable Channel

Add the nixos-unstable channel for `nix-shell` and run `sudo nix-channel --update` to fix issues with `command-not-found`:

```bash
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
```

### Delete Bash History (desktop and laptop)

Delete `.bash_history` to ensure the Wi-Fi password is removed from it:

```bash
rm ~/.bash_history
```

## Non-Declarative Setups

### Utilities

1. [Firefox](./non-declarative/docs/utilities/firefox/firefox.md)
2. [GPG](./non-declarative/docs/utilities/gpg.md)
3. [Dropbox](./non-declarative/docs/utilities/dropbox.md)
4. [virt-manager](./non-declarative/docs/utilities/virt-manager.md)

### Games

1. [steam](./non-declarative/docs/games/steam.md)
2. [TF2](./non-declarative/docs/games/tf2.md)
3. [osu](./non-declarative/docs/games/osu.md)
4. [RetroArch](./non-declarative/docs/games/retroarch.md)
5. [Yuzu](./non-declarative/docs/games/yuzu.md)

## Acknowledgements

Other configurations from where I learned and copied:

- [MatthiasBenaets/nixos-config](https://github.com/MatthiasBenaets/nixos-config)
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles)
