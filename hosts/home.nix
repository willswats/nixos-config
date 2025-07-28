{ pkgs
, globals
, ...
}:

{
  imports = [
    ../modules/desktop/sway/home.nix
    # ../modules/desktop/hyprland/home.nix
    ../modules/theme/fonts/home.nix
    ../modules/theme/cursor/home.nix
    ../modules/theme/gtk/home.nix
    ../modules/theme/qt/home.nix
    ../modules/theme/catppuccin/home.nix
    ../modules/development/git/home.nix
    ../modules/development/gpg/home.nix
    ../modules/development/neovim/home.nix
    ../modules/development/helix/home.nix
    ../modules/development/vscode/home.nix
    ../modules/development/lazygit/home.nix
    ../modules/development/rust/home.nix
    ../modules/development/dotnet/home.nix
    ../modules/development/python/home.nix
    ../modules/development/flutter/home.nix
    ../modules/development/haskell/home.nix
    ../modules/development/direnv/home.nix
    # ../modules/development/unity/home.nix
    ../modules/utilities/librewolf/home.nix
    ../modules/utilities/chromium/home.nix
    ../modules/utilities/mpv/home.nix
    ../modules/utilities/oculante/home.nix
    ../modules/utilities/gimp/home.nix
    ../modules/utilities/krita/home.nix
    ../modules/utilities/kdenlive/home.nix
    ../modules/utilities/mullvad-vpn/home.nix
    ../modules/utilities/vesktop/home.nix
    ../modules/utilities/fish/home.nix
    ../modules/utilities/kitty/home.nix
    ../modules/utilities/bottom/home.nix
    ../modules/utilities/yazi/home.nix
    ../modules/utilities/nautilus/home.nix
    ../modules/utilities/bluetuith/home.nix
    ../modules/utilities/gnome-keyring/home.nix
    ../modules/utilities/onlyoffice/home.nix
    ../modules/utilities/streamlink-twitch-gui/home.nix
    ../modules/utilities/zathura/home.nix
    ../modules/utilities/hakuneko/home.nix
    ../modules/utilities/beets/home.nix
    ../modules/servers/mpd/home.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = globals.user;
    homeDirectory = globals.directories.home;
    stateVersion = "23.05";

    packages = with pkgs; [
      # Utilities
      ## GUI
      obs-studio
      gpu-screen-recorder-gtk
      fragments
      popsicle
      gnome-disk-utility
      moonlight-qt
      grayjay
      miru
      spotify
      euphonica
      dropbox
      zotero
      resources
      pixelorama
      ## CLI
      wget
      ffmpeg
      mkvtoolnix-cli
      ouch
      killall
      appimage-run
      trash-cli
      yt-dlp
      spotdl
      woeusb
      vulkan-tools
      distrobox
      lynx
      steam-run
      # Infosec
      nmap
      nikto
      gobuster
      exiftool
      busybox
      # Development
      gh
      codeberg-cli
      nodePackages.nodejs
      nodePackages.pnpm
      nodePackages.live-server
      nodePackages.vercel
      godot_4
    ];
  };

  # Use `xdg-mime query filetype` to find a file's MIME type
  # Use `nix-store --query $(which firefox)` (replacing `firefox`) to find the location of the `.desktop` file and it's name
  xdg.mimeApps.enable = true;
  xdg.configFile."mimeapps.list".force = true;
}
