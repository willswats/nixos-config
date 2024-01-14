# TODO

## Neovim

- [ ] Finish dap setup
- [ ] Switch from `sqls` to `sql-language-server` - [needs to be packaged](https://github.com/NixOS/nixpkgs/issues/203887)
- [ ] Fix sqlfluff linter crashing (index out of range)
- [ ] Set Neovim `desc` for nested leader keymaps

## Hyprland

- [ ] Use `hyprctl dpms off` and `hyprctl dpms on` to turn on and off the display when idle
- [ ] Replace temp exit script - waiting for [fix](https://github.com/hyprwm/Hyprland/issues/3558)

## MPV

- [ ] Add binding for selecting next and previous in MPV uosc playlist and file explorer

## Add pkgs

- [ ] Add nixpkgs catppuccin-sddm package - waiting on [PR](https://github.com/NixOS/nixpkgs/pull/255808)

## Other

- [ ] Airshipper will not launch without setting `WINIT_UNIX_BACKEND=x11`, however, setting this system wide causes Alacritty to always open in floating window mode
- [ ] Format disk with [disko](https://github.com/nix-community/disko)
- [ ] Setup a Yubikey for GPG git commit signing
