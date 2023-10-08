{ pkgs, globals, ... }:

{
  imports = [
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
    ../modules/utilities/firefox/home.nix
    ../modules/utilities/mpv/home.nix
    ../modules/utilities/spotify-player/home.nix
    ../modules/utilities/fish/home.nix
    ../modules/utilities/alacritty/home.nix
    ../modules/utilities/bottom/home.nix
    ../modules/utilities/pcmanfm/home.nix
    ../modules/utilities/mullvad-vpn/home.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = globals.user;
    homeDirectory = globals.homeDir;
    stateVersion = "23.05";

    packages = with pkgs; [
      # System
      wget
      zip
      unzip
      killall
      trash-cli
      appimage-run
      # Development
      python311Full
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
      zotero
    ];
  };

  # Use `xdg-mime query filetype` to find a file's MIME type
  # Use `nix-store --query $(which firefox)` (replacing `firefox`)to find the location of the .destkop file and it's name
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Neovim
      "text/plain" = [ "nvim.desktop" ]; # plain text
      "text/html" = [ "nvim.desktop" ]; # html
      "text/css" = [ "nvim.desktop" ]; # css
      "text/vnd.trolltech.linguist" = [ "nvim.desktop" ]; # ts
      # PCmanFm
      "inode/directory" = [ "pcmanfm.desktop" ]; # Directories
      # qView
      "image/png" = [ "com.interversehq.qView.desktop" ]; # jpg
      "image/jpg" = [ "com.interversehq.qView.desktop" ]; # png
      # Firefox
      "application/pdf" = [ "firefox.desktop" ]; # pdf
    };
  };
}
