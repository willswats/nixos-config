# TODO

## High priority

- [ ] Look into pipewire
- [ ] Fix opening on tty1 instead of tty7 (lightdm):
  - [ ] Create a nixos-unstable vm
  - [ ] Set DE as gnome and view configuration file to see how it is set
  - [ ] Test if it's necessary to add nixos-unstable channel to fix command not found
- [ ] Add spice (virtual)
- [ ] Add way of accepting dunst notification
- [ ] Fix markdown issues:
  - [ ] Current indenting by 4, should be 2
  - [ ] No option for updating ToC in lsp actions
- [ ] Fix plymouth only showing on power off
- [ ] Lock screen is set to 10 minutes, not one hour
- [ ] Add global variables:
  - [ ] hostname
  - [ ] monitors
  - [ ] wallpaper
  - [ ] fontSize
  - [ ] directoriesToCreate / bookmarks

## Firefox

- [ ] Install extensions from NUR

## Neovim

- [ ] Move lsp keymaps into on_attach
- [ ] Add session plugin
- [ ] Setup dap

## Other

- [ ] Mullvad GUI error - Inconsistent version {"guiVersion":"2023.4","daemonVersion":"2023.3"}
- [ ] Fix Catppuccin black borders in lightdm
- [ ] Move from gnome-keyring
- [ ] Move nvim config to home manager
