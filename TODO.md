# TODO

## High Priority

### Features

- [ ] Auto create directories
- [ ] Create firefox nix config
- [ ] Create seperate configurations and variables for:
  - [ ] desktop
  - [ ] laptop
  - [ ] virtual
- [ ] Switch to systemd boot

### Fix

- [ ] Can't move floating windows with i3 floating_modifier
- [ ] Assigning i3 workspaces to monitors causes errors
- [ ] i3 starting on ws10 - [issue](https://github.com/nix-community/home-manager/issues/695)
- [ ] polybar can't find i3 (doesn't show resize mode) - [issue](https://github.com/nix-community/home-manager/issues/213)
- [ ] Fix bluetooth - issue [issue](https://github.com/NixOS/nixpkgs/issues/170573)

### Desktop specific

- [ ] Nvida drivers

### VM Specific

- [ ] spice (or whatever is needed for mouse4 and mouse5 + copy, paste and file transfer between host and vm )

## Low Priority

### Home Manager

- [ ] Move from gnome-keyring
- [ ] Move nvim config to home manager
- [ ] Fix Catppuccin black borders in lightdm
- [ ] Mullvad GUI error - Inconsistent version {"guiVersion":"2023.4","daemonVersion":"2023.3"}

### Neovim

- [ ] Move lsp keymaps into on_attach
- [ ] Add session plugin
- [ ] Setup dap
