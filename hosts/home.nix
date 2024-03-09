{ pkgs, globals, ... }:

{
  imports = [
    ../modules/desktop/hyprland/home.nix
    ../modules/theme/fonts/home.nix
    ../modules/theme/cursor/home.nix
    ../modules/theme/gtk/home.nix
    ../modules/theme/qt/home.nix
    ../modules/development/git/home.nix
    ../modules/development/gpg/home.nix
    ../modules/development/neovim/home.nix
    ../modules/development/vscode/home.nix
    ../modules/development/lazygit/home.nix
    ../modules/development/rustup/home.nix
    ../modules/development/dotnet/home.nix
    ../modules/development/haskell/home.nix
    ../modules/development/flutter/home.nix
    ../modules/utilities/firefox/home.nix
    ../modules/utilities/chromium/home.nix
    ../modules/utilities/mpv/home.nix
    ../modules/utilities/swayimg/home.nix
    ../modules/utilities/mullvad-vpn/home.nix
    ../modules/utilities/vesktop/home.nix
    ../modules/utilities/fish/home.nix
    ../modules/utilities/foot/home.nix
    ../modules/utilities/bottom/home.nix
    ../modules/utilities/yazi/home.nix
    ../modules/utilities/bluetuith/home.nix
    ../modules/utilities/gnome-keyring/home.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = globals.user;
    homeDirectory = globals.homeDir;
    stateVersion = "23.05";

    packages = with pkgs; [
      # Utilities 
      ## GUI
      bitwarden
      obs-studio
      gpu-screen-recorder-gtk
      gimp
      krita
      shotcut
      fragments
      dropbox
      spotify
      onlyoffice-bin_latest
      zotero
      ## CLI
      wget
      zip
      unzip
      _7zz
      killall
      fzf
      appimage-run
      trash-cli
      yt-dlp
      # Development
      python311Full
      nodePackages.nodejs
      nodePackages.pnpm
      nodePackages.live-server
    ];
  };

  # Use `xdg-mime query filetype` to find a file's MIME type
  # Use `nix-store --query $(which firefox)` (replacing `firefox`) to find the location of the `.desktop` file and it's name
  xdg.mimeApps.enable = true;
  xdg.configFile."mimeapps.list".force = true;
}
