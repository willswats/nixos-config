# TODO

## High Priority

### Features

- [ ] Create seperate configurations and variables for:
  - [ ] desktop
  - [ ] laptop
  - [ ] virtual
- [ ] Auto create directories
- [ ] Switch to systemd boot
- [ ] Lightdm background
- [ ] Create a firefox nix config

### Fix

- [ ] Neovim mason error
- [ ] Mullvad GUI error
- [ ] Default themes for certain qt apps (Yuzu, PCSX2)
- [ ] Assigning i3 workspaces to monitors causes errors
- [ ] Fix bluetooth - issue [issue](https://github.com/NixOS/nixpkgs/issues/170573)
- [ ] i3 starting on ws10 - [issue](https://github.com/nix-community/home-manager/issues/695)
- [ ] polybar can't find i3 (doesn't show resize mode) - [issue](https://github.com/nix-community/home-manager/issues/213)

### Desktop specific

- [ ] Nvida drivers

### VM Specific

- [ ] spice (or whatever is needed for mouse4 and mouse5 + copy, paste and file transfer between host and vm )

## Low Priority

### Home Manager

- [ ] Move from gnome-keyring
- [ ] Move nvim config to home manager

### Neovim

- [ ] Move lsp keymaps into on_attach
- [ ] Add session plugin
- [ ] Setup dap
- [ ] Remove plugins (mason?)
