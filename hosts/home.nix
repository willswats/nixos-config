{ config, pkgs, ... }:

{
  imports = [
    ../modules/theme
    ../modules/fonts
    ../modules/bookmarks
    ../modules/git
    ../modules/firefox
    ../modules/i3
    ../modules/neovim
    ../modules/fish
    ../modules/alacritty
    ../modules/bottom
    ../modules/lazygit
    ../modules/rustup
    ../modules/mullvad-vpn
  ];

  programs.home-manager.enable = true;

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

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
      git
      nodePackages.pnpm
      # Utilities
      pcmanfm
      gnome.file-roller
      gnome.seahorse
      mpv
      qview
      flameshot
      obs-studio
      gimp
      shotcut
      fragments
      virt-manager
      rclone
      rclone-browser
    ];
  };
}