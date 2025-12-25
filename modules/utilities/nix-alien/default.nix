{ pkgs, inputs, ... }:

{
  environment.systemPackages = [
    inputs.nix-alien.${pkgs.stdenv.hostPlatform.system}.alien
  ];
  # Optional, needed for `nix-alien-ld`
  programs.nix-ld.enable = true;
}
