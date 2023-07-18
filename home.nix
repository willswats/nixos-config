{ config, pkgs, ... }:

{
  imports = [
    ./modules/i3
    ./modules/theme
    ./modules/fish
    ./modules/lazygit
  ];

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "willswats";
      userEmail = "williamstuwatson@gmail.com";
      extraConfig.init.defaultBranch = "main";
    };
  };

  home = {
    username = "will";
    homeDirectory = "/home/will";
    stateVersion = "23.05";

    packages = with pkgs; [
      killall
      wget
      zip
      unzip
      # Development
      git
      gcc
      rustup
      nixpkgs-fmt
      nodejs_20
      nodePackages.pnpm
      nodePackages.prettier
      nodePackages.markdownlint-cli
      nodePackages.neovim
      python311
      python311Packages.pip
      python311Packages.pynvim
      fd
      ripgrep
      xclip
      fish
      alacritty
      neovim
      lazygit
      bottom
      trash-cli
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
      gnome.seahorse
      opentabletdriver
      mullvad-vpn
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

  xdg = {
    enable = true;
    configFile.nvim.source = ./config/nvim;
    configFile.i3.source = ./config/i3;
    configFile.polybar.source = ./config/polybar;
    configFile.alacritty.source = ./config/alacritty;
    configFile.bottom.source = ./config/bottom;
    configFile.dunst.source = ./config/dunst;
    configFile.rofi.source = ./config/rofi;
    configFile.${"Mullvad VPN"}.source = ./config/${"Mullvad VPN"};
  };
}
