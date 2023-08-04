{ pkgs, ... }:

{
  imports = [
    ../modules/fonts/home.nix
    ../modules/cursor/home.nix
    ../modules/gtk/home.nix
    ../modules/qt/home.nix
    ../modules/git/home.nix
    ../modules/gpg/home.nix
    ../modules/firefox/home.nix
    ../modules/i3/home.nix
    ../modules/nixvim/home.nix
    ../modules/mpv/home.nix
    ../modules/fish/home.nix
    ../modules/alacritty/home.nix
    ../modules/bottom/home.nix
    ../modules/lazygit/home.nix
    ../modules/rustup/home.nix
    ../modules/pcmanfm/home.nix
    ../modules/mullvad-vpn/home.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "will";
    homeDirectory = "/home/will";
    stateVersion = "23.05";

    packages = with pkgs; [
      # Essentials
      wget
      zip
      unzip
      killall
      xclip
      appimage-run
      # Development
      nodePackages.pnpm
      # Utilities
      gnome.file-roller
      qview
      obs-studio
      gimp
      shotcut
      fragments
      rclone
      rclone-browser
      popsicle
    ];
  };
}
