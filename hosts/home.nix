{ config, pkgs, ... }:

{
  imports = [
    ../modules/theme/home.nix
    ../modules/fonts/home.nix
    ../modules/bookmarks/home.nix
    ../modules/git/home.nix
    ../modules/firefox/home.nix
    ../modules/i3/home.nix
    ../modules/neovim/home.nix
    ../modules/fish/home.nix
    ../modules/alacritty/home.nix
    ../modules/bottom/home.nix
    ../modules/lazygit/home.nix
    ../modules/rustup/home.nix
    ../modules/pcmanfm/home.nix
    ../modules/mullvad-vpn/home.nix
  ];

  programs.home-manager.enable = true;

  # programs.nix-index = {
  #   enable = true;
  #   enableFishIntegration = true;
  # };

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
      rclone
      rclone-browser
    ];
  };
}
