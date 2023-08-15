{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    rustup
  ];

  # This removes the need for the command "rustup default stable" on fresh install
  home.file.".rustup/settings.toml".text = ''
    default_toolchain = "stable-x86_64-unknown-linux-gnu"
    profile = "default"
    version = "12"
  '';
}
