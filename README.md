# NixOS Config

My [NixOS](https://nixos.org/) config.

## Table of Contents

<!--toc:start-->

- [Installing NixOS](#installing-nixos)
- [Installing nixos-config](#installing-nixos-config)
  - [Connect to Wi-Fi](#connect-to-wi-fi)
  - [Clone the Repository](#clone-the-repository)
  - [Add hardware-configuration.nix](#add-hardware-configurationnix)
  - [Add boot.initrd.luks.devices Information](#add-bootinitrdluksdevices-information)
  - [Build the Config](#build-the-config)
- [Post-installation](#post-installation)
  - [Add the nixos-unstable Channel](#add-the-nixos-unstable-channel)
  - [Delete Bash History](#delete-bash-history)
- [Non-Declarative Set-ups](#non-declarative-set-ups)
  - [Utilities](#utilities)
  - [Games](#games)
- [Acknowledgements](#acknowledgements)
- [License](#license)
<!--toc:end-->

## Installing NixOS

1. Set CSM support (or your equivalent) to disabled in the bios (ensures that you boot in UEFI, otherwise NixOS will use grub instead of systemd boot).
2. Download the NixOS Plasma ISO from [nixos.org](https://nixos.org/download.html).
3. Write the NixOS Plasma ISO to a USB and boot into it.
4. Run the installer and set the following:
   - Language
   - Username and password
   - Use the same password for the administrator account
   - Desktop: No desktop
   - Allow unfree packages
   - Erase the disk
   - Enable swap with hibernation
   - Enable encryption
5. Reboot the system.

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

### Add boot.initrd.luks.devices Information

Copy the text that starts with `boot.initrd.luks.devices` from `/etc/nixos/configuration.nix` to `~/Code/nixos-config/hosts/host/default.nix`, with `host` being your desired host. Delete any previous `boot.initrd.luks.devices` entries in the `default.nix` file.

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

### Delete Bash History

Delete `.bash_history` to ensure the Wi-Fi password is removed from it:

```bash
rm ~/.bash_history
```

## Non-Declarative Set-ups

### Utilities

1. [Dropbox](./docs/utilities/dropbox.md)
2. [LibreWolf](./docs/utilities/librewolf.md)
3. [GPG](./docs/utilities/gpg.md)
4. [virt-manager](./docs/utilities/virt-manager.md)

### Servers

1. [mpd](./docs/servers/mpd.md)

### Games

1. [steam](./docs/games/steam.md)
2. [TF2](./docs/games/tf2.md)
3. [osu](./docs/games/osu.md)

## Acknowledgements

Other configurations from where I learned and copied:

- [MatthiasBenaets/nixos-config](https://github.com/MatthiasBenaets/nixos-config)
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles)

## License

All code is MIT licensed.

The wallpaper is under it's own copyright and can be found on [Reddit](https://www.reddit.com/r/WidescreenWallpaper/comments/qhojc3/mount_fuji_japan_%F0%92%8C%8B_5160_2160/).
