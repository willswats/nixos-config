# NixOS Config

My [NixOS](https://nixos.org/) config.

## Table of Contents

<!--toc:start-->

- [NixOS Config](#nixos-config)
  - [Table of Contents](#table-of-contents)
  - [Installing NixOS](#installing-nixos)
  - [Installing nixos-config](#installing-nixos-config)
    - [Connect to Wi-Fi](#connect-to-wi-fi)
    - [Clone the Repository](#clone-the-repository)
    - [Add hardware-configuration.nix](#add-hardware-configurationnix)
    - [Add `boot.initrd.luks.devices` Information](#add-bootinitrdluksdevices-information)
    - [Build the Config](#build-the-config)
  - [Post-installation](#post-installation)
    - [Add the nixos-unstable Channel](#add-the-nixos-unstable-channel)
  - [Non-Declarative Set-ups](#non-declarative-set-ups)
    - [Utilities](#utilities)
    - [Games](#games)
  - [Acknowledgements](#acknowledgements)
  <!--toc:end-->

## Installing NixOS

1. Disable CSM support (or your equivalent) in the bios (ensures that you boot in UEFI, otherwise NixOS will use grub instead of systemd boot).
2. Download the NixOS Graphical ISO from [nixos.org](https://nixos.org/download.html).
3. Write the NixOS Graphical ISO to a USB and boot into it.
4. Wipe the drives that you plan to install NixOS on with GNOME Disks.
5. Run the installer and set the following:
   - Language
   - Username and password
   - Use the same password for the administrator account
   - Desktop: No desktop
   - Allow unfree packages
   - Erase the disk
   - Enable swap with hibernation
   - Enable encryption
6. Reboot the system.

## Installing nixos-config

### Connect to Wi-Fi

To list Wi-Fi access points:

```bash
nmcli dev wifi list
```

To connect to a Wi-Fi access point (replace `network-ssid` with the name of the network):

```bash
sudo nmcli dev wifi connect network-ssid --ask
```

### Clone the Repository

Enter a nix-shell with `git` and `neovim`:

```bash
nix-shell -p git helix
```

Clone the repository to `~/Code/nixos-config`:

```bash
git clone https://codeberg.org/willswats/nixos-config.git ~/Code/nixos-config
```

### Add hardware-configuration.nix

Delete the old `hardware-configuration.nix` (replace `host` with the desired host):

```bash
rm ~/Code/nixos-config/hosts/host/hardware-configuration.nix
```

Add the `hardware-configuration.nix` to your chosen host (replace `host` with the desired host):

```bash
cp /etc/nixos/hardware-configuration.nix ~/Code/nixos-config/hosts/host/
```

### Add `boot.initrd.luks.devices` Information

Copy the text that starts with `boot.initrd.luks.devices` from `/etc/nixos/configuration.nix` to `~/Code/nixos-config/hosts/host/default.nix`, with `host` being your desired host. Delete any previous `boot.initrd.luks.devices` entries in the `default.nix` file.

I do this by opening `/etc/nixos/configuration.nix` with `hx`, copying the line, and then using the it's file explorer to navigate to `~/Code/nixos-config/hosts/host/default.nix`.

### Build the Config

`CD` to the directory:

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

Note: if you get the error `Too many open files`, run `ulimit -n 655535`.

Reboot the system:

```bash
reboot
```

## Post-installation

### Add the nixos-unstable Channel

Add the `nixos-unstable` channel for `nix-shell` and run `sudo nix-channel --update` to fix issues with `command-not-found` :

```bash
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
```

## Non-Declarative Set-ups

### Utilities

1. [Dropbox](./docs/utilities/dropbox.md)
2. [Firefox](./docs/utilities/firefox.md)
3. [SSH](./docs/utilities/ssh.md)
4. [virt-manager](./docs/utilities/virt-manager.md)
5. [rescrobbled](./docs/utilities/rescrobbled.md)

### Games

1. [steam](./docs/games/steam.md)
2. [osu](./docs/games/osu.md)

## Acknowledgements

Other configurations from where I learned and copied:

- [MatthiasBenaets/nixos-config](https://github.com/MatthiasBenaets/nixos-config)
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles)
