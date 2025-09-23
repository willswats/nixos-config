{ ... }:

{
  # Using the NixOS option instead of Home Manager due to this issue:
  # https://github.com/nix-community/home-manager/issues/1454
  services.gnome.gnome-keyring.enable = true;
  # Use gcr (enabled with gnome-keyring) as ssh-agent
  environment.variables.SSH_AUTH_SOCK = "/run/user/1000/gcr/ssh";
}
