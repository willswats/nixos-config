# TODO

## Features

- [ ] Setup gnome-keyring
- [ ] Set screen timeout / lock (xss-lock?)
- [ ] Setup support for AppImages (Slippi) and Flatpak
- [ ] Switch to systemd boot (or a way to make disk encryption pass quicker)
- [ ] Auto create directories
- [ ] Create a firefox nix config
- [ ] Move nvim config to nix

## Fix

- [ ] Fix nvim errors
- [ ] Fix mullvad gui error
- [ ] Fix default themes for certain qt apps (Yuzu, PCSX2)

## Cleanup

- [ ] Set variables in config:
  - [ ] hostName
  - [ ] username
  - [ ] nixos-config name
  - [ ] nixos-config location
- [ ] Remove unneeded nvim plugins (Mason?)
- [ ] Create hosts:
  - [ ] desktop
  - [ ] laptop
  - [ ] virtualmachine
- [ ] Decide what to do with steam.md, retroarch.md, slippi.md and yuzu.md
- [ ] Create a flake.nix for each project and remove the packages from the base system

## Desktop specific

- [ ] Nvida drivers
- [ ] Proton-GE

## Laptop specific

- [ ] TLP

## VM Specific

- [ ] spice (or whatever is needed for mouse4 and mouse5 + copy, paste and file transfer between host and vm )
