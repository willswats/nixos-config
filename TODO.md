# TODO

## High Priority

### Neovim

- [ ] Finish dap setup
- [ ] Fix OmniSharp can't find .NET - must potentially wait for this [PR](https://github.com/NixOS/nixpkgs/pull/249091)
- [ ] Set Neovim `desc` for nested leader keymaps

### Other (1)

- [ ] Install firefox extensions from NUR - [example](https://github.com/rhoriguchi/nixos-setup/blob/master/flake.nix)
- [ ] Overlay spotify-player to be built without image and notify features
- [ ] Overlay osu version instead of wrapping the AppImage

## Low Priority

### Theme

- [ ] Fix missing GZDoom icon
- [ ] Fix missing steam tray icon image
- [ ] Fix Catppuccin black borders in lightdm

### Other (2)

- [ ] Fix Mullvad GUI inconsistent version {"guiVersion":"2023.4","daemonVersion":"2023.3"}
- [ ] Fix can't accept dunst notification (e.g. pairing bluetooth)
- [ ] Fix i3lock displaying "locking" upon opening laptop lid after a long period of time
- [ ] Plymouth `boot.initrd.systemd.enable` causing `Failed to execute /sbin/init` after entering password to unlock encryption on nvidia proprietary drivers
- [ ] Setup a Yubikey for GPG git commit signing
