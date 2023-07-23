# TODO

## High Priority

### Features

- [ ] Add commands to README (avoid GUI installer):
  - [ ] Partition EXT4 drive
  - [ ] Swap space
  - [ ] LUKS encryption
- [ ] Switch to systemd boot
- [ ] Add hardware-configuration.nix:
  - [ ] desktop
  - [ ] laptop
- [ ] Merge dotfiles .git and nixos-config .git
- [ ] Delete old dotfiles and fedora-sericea-config

### Desktop specific

- [ ] Nvida drivers

### VM Specific

- [ ] spice (or whatever is needed for mouse4 and mouse5 + copy, paste and file transfer between host and vm )

## Low Priority

### Home Manager

- [ ] Add variables:
  - [ ] hostname
  - [ ] directoriesToCreate

### Firefox

- [ ] Install extensions from NUR

### i3

- [ ] Lock screen is set to 10 minutes, not one hour
- [ ] Can't move floating windows with i3 floating_modifier
- [ ] Assigning i3 workspaces to monitors causes errors
- [ ] i3 starting on ws10 - [issue](https://github.com/nix-community/home-manager/issues/695)
- [ ] polybar can't find i3 (doesn't show resize mode) - [issue](https://github.com/nix-community/home-manager/issues/213)

### Neovim

- [ ] Fix markdown files should indent by 2, not 4
- [ ] Fix markdown files do not show action for ToC
- [ ] Move lsp keymaps into on_attach
- [ ] Add session plugin
- [ ] Setup dap

### Other

- [ ] Fix bluetooth - issue [issue](https://github.com/NixOS/nixpkgs/issues/170573)
- [ ] Mullvad GUI error - Inconsistent version {"guiVersion":"2023.4","daemonVersion":"2023.3"}
- [ ] Fix Catppuccin black borders in lightdm
- [ ] Move from gnome-keyring
- [ ] Move nvim config to home manager
