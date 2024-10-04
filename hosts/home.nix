{ pkgs, globals, ... }:

{
  imports = [
    ../modules/desktop/sway/home.nix
    ../modules/theme/fonts/home.nix
    ../modules/theme/cursor/home.nix
    ../modules/theme/gtk/home.nix
    ../modules/theme/qt/home.nix
    ../modules/theme/catppuccin/home.nix
    ../modules/development/git/home.nix
    ../modules/development/gpg/home.nix
    ../modules/development/neovim/home.nix
    ../modules/development/vscode/home.nix
    ../modules/development/lazygit/home.nix
    ../modules/development/rust/home.nix
    ../modules/development/dotnet/home.nix
    ../modules/development/haskell/home.nix
    ../modules/development/flutter/home.nix
    ../modules/development/python/home.nix
    ../modules/development/unity/home.nix
    ../modules/utilities/firefox/home.nix
    ../modules/utilities/chromium/home.nix
    ../modules/utilities/mpv/home.nix
    ../modules/utilities/oculante/home.nix
    ../modules/utilities/gpu-screen-recorder-gtk/home.nix
    ../modules/utilities/mullvad-vpn/home.nix
    ../modules/utilities/vesktop/home.nix
    ../modules/utilities/fish/home.nix
    ../modules/utilities/kitty/home.nix
    ../modules/utilities/bottom/home.nix
    ../modules/utilities/pcmanfm/home.nix
    ../modules/utilities/yazi/home.nix
    ../modules/utilities/bluetuith/home.nix
    ../modules/utilities/gnome-keyring/home.nix
    ../modules/utilities/onlyoffice/home.nix
    ../modules/utilities/streamlink-twitch-gui/home.nix
    ../modules/utilities/yacreader/home.nix
    ../modules/utilities/hakuneko/home.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = globals.user;
    homeDirectory = globals.directories.home;
    stateVersion = "23.05";

    packages = with pkgs; [
      # Utilities 
      ## GUI
      thunderbird
      bitwarden
      # fluffychat # add back after this issue is fixed: https://github.com/krille-chan/fluffychat/issues/1258
      obs-studio
      gimp
      krita
      shotcut
      deluge
      popsicle
      gnome-disk-utility
      moonlight-qt
      jellyfin-media-player
      freetube
      miru
      spotify
      zotero
      maestral-gui
      ## CLI
      wget
      ffmpeg
      ouch
      killall
      appimage-run
      trash-cli
      yt-dlp
      mkvtoolnix-cli
      fastfetch
      woeusb
      maestral
      # Development
      gh
      nodePackages.nodejs
      nodePackages.pnpm
      nodePackages.live-server
      godot_4
    ];
  };

  # Use `xdg-mime query filetype` to find a file's MIME type
  # Use `nix-store --query $(which firefox)` (replacing `firefox`) to find the location of the `.desktop` file and it's name
  xdg.mimeApps.enable = true;
  xdg.configFile."mimeapps.list".force = true;
}
