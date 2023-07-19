{ config, pkgs, ... }:

{
  imports = [
    ./modules/theme
    ./modules/fonts
    ./modules/git
    ./modules/i3
    ./modules/neovim
    ./modules/fish
    ./modules/alacritty
    ./modules/bottom
    ./modules/lazygit
    ./modules/mullvad-vpn
  ];

  programs = {
    home-manager.enable = true;
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
      # Development
      git
      nodePackages.pnpm
      # Utilities
      firefox
      pcmanfm
      gnome.file-roller
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
      opentabletdriver
      # Entertainment
      steam
      retroarch
      yuzu-mainline
      pcsx2
      rpcs3
      osu-lazer-bin
      zandronum
      prismlauncher
    ];
  };
}
