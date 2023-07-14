{ config, pkgs, ... }:

{
  home.username = "will";
  home.homeDirectory = "/home/will";

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    wget
    zip
    unzip
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
    # Desktop
    rofi
    polybar
    feh
    blueman
    pavucontrol
    brightnessctl
    redshift
    lxde.lxsession
    lxappearance
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugins
    qt6ct
    dconf
    gtk-engine-murrine
    gnome-themes-extra
    # Utilities
    firefox
    xfce.thunar
    gnome.file-roller
    mpv
    qview
    flameshot
    obs-studio
    gimp
    shotcut
    fragments
    gradience
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

  home.pointerCursor = {
    x11 = {
      enable = true;
    };
    gtk = {
      enable = true;
    };
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 32; # 24 32 48 64
  };

  xdg.configFile.nvim.source = ./config/nvim;
  xdg.configFile.i3.source = ./config/i3;
  xdg.configFile.polybar.source = ./config/polybar;
  xdg.configFile.alacritty.source = ./config/alacritty;
  xdg.configFile.bottom.source = ./config/bottom;
  xdg.configFile.dunst.source = ./config/dunst;
  xdg.configFile.fish.source = ./config/fish;
  xdg.configFile.lazygit.source = ./config/lazygit;
  xdg.configFile.rofi.source = ./config/rofi;
  xdg.configFile.mullvad-vpn.source = ./config/MullvadVPN;

  programs = {
    neovim = {
      withNodeJs = true;
      withPython3 = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "willswats";
    userEmail = "williamstuwatson@gmail.com";
  };

  services.dunst.enable = true;
  services.picom.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "standard";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "blue";
        flavor = "mocha";
      };
    };
  };
}
