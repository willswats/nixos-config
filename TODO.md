# TODO

- [ ] Fix opening on tty1 instead of tty7 (lightdm)
- [ ] Fix error for command not found in shell
- [ ] Fix gnome-keyring error - Environment variable $SSH_AUTH_SOCK not set, ignoring. gnome-keyring-daemon: no process capabilities, insecure memory might get used
- [ ] Fix cannot pair with bluetooth speakers
- [ ] Fix scale of alacritty font on laptop
- [ ] Add hardware-configuration.nix:
  - [ ] desktop
- [ ] Add nvida drivers (desktop)
- [ ] Add spice (virtual)

## Home Manager

- [ ] Add global variables:
  - [ ] hostname
  - [ ] wallpaper
  - [ ] lockscreen
  - [ ] directoriesToCreate
  - [ ] bookmarks
  - [ ] monitors

## Firefox

- [ ] Install extensions from NUR

## i3

- [ ] Lock screen is set to 10 minutes, not one hour
- [ ] polybar can't find i3 (doesn't show resize mode) - [issue](https://github.com/nix-community/home-manager/issues/213)

## Neovim

- [ ] Fix markdown issues:
  - [ ] Current indenting by 4, should be 2
  - [ ] No option for updating ToC in lsp actions
- [ ] Move lsp keymaps into on_attach
- [ ] Add session plugin
- [ ] Setup dap

## Other

- [ ] Mullvad GUI error - Inconsistent version {"guiVersion":"2023.4","daemonVersion":"2023.3"}
- [ ] Fix Catppuccin black borders in lightdm
- [ ] Move from gnome-keyring
- [ ] Move nvim config to home manager
