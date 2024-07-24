{ ... }:

{
  # Using the NixOS option instead of Home Manager due to this issue: 
  # https://github.com/nix-community/home-manager/issues/1454
  services.gnome.gnome-keyring.enable = true;
}
