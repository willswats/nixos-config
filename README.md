# NixOS Config

My NixOS config.

## Table of Contents

- [Installation](#installation)
  - [Graphical Setup](#graphical-setup)
  - [Installing nixos-config](#installing-nixos-config)
- [Non-Declarative Setups](#non-declarative-setups)
  - [Utilities (all hosts)](#utilities-all-hosts)
  - [Games (desktop)](#games-desktop)

## Installation

### Graphical Setup

1. Write the NixOS GNOME ISO to a USB and boot into it.
2. Run the installer and set an appropriate username and password.
3. Create an EXT4 partition with 1.5x the swap space of your RAM (desktop has 16GB RAM - 24GB swap) (laptop has 32GB RAM - 48GB swap).
4. Enable encryption if needed (desktop and laptop).
5. Set the desktop environment to no desktop.
6. Reboot the system.

### Installing nixos-config

Clone the repository:

```bash
git clone https://github.com/willswats/nixos-config.git
```

CD into the cloned repository and run:

```bash
sudo nixos-rebuild switch --flake .#will
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
