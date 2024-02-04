# TODO

## Neovim

### Neovim - General

- [ ] Finish dap setup
- [ ] Set Neovim `desc` for nested leader keymaps

### Neovim - SQL

- [ ] Fix sqlfluff linter crashing (index out of range)
- [ ] Switch from `sqls` to `sql-language-server` - [needs to be packaged](https://github.com/NixOS/nixpkgs/issues/203887)

## Hyprland

- [ ] Floating windows are in fullscreen by default (Steam, Bitwarden)
- [ ] Replace temp exit script - waiting for [fix](https://github.com/hyprwm/Hyprland/issues/3558)

## MPV

- [ ] Add binding for selecting next and previous in MPV uosc playlist and file explorer

## Airshipper

- [ ] Airshipper will not launch without setting `WINIT_UNIX_BACKEND=x11`, setting this system wide causes Alacritty to always open as a floating window

## Retroarch

- [ ] citra core fails to build to due to an issue with webkitgtk

## Soundux

- [ ] Soundux fails to build to due to an issue with webkitgtk

## Add pkgs

- [ ] Add nixpkgs catppuccin-sddm package - waiting on [PR](https://github.com/NixOS/nixpkgs/pull/255808)

## Other

- [ ] Format disk with [disko](https://github.com/nix-community/disko)
- [ ] Setup a Yubikey for GPG git commit signing
