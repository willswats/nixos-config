{ pkgs, ... }:

{
  imports = [
    ../modules/theme/fonts/home.nix
    ../modules/theme/cursor/home.nix
    ../modules/theme/gtk/home.nix
    ../modules/theme/qt/home.nix
    ../modules/desktop/i3/home.nix
    ../modules/development/git/home.nix
    ../modules/development/gpg/home.nix
    ../modules/development/neovim/home.nix
    ../modules/development/lazygit/home.nix
    ../modules/development/rustup/home.nix
    ../modules/utilities/firefox/home.nix
    ../modules/utilities/mpv/home.nix
    ../modules/utilities/spotify-player/home.nix
    ../modules/utilities/fish/home.nix
    ../modules/utilities/alacritty/home.nix
    ../modules/utilities/bottom/home.nix
    ../modules/utilities/pcmanfm/home.nix
    ../modules/utilities/flameshot/home.nix
    ../modules/utilities/mullvad-vpn/home.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "will";
    homeDirectory = "/home/will";
    stateVersion = "23.05";

    packages = with pkgs; [
      # System
      wget
      zip
      unzip
      killall
      xclip
      trash-cli
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
