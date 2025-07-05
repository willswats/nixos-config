{ ... }:

{
  imports = [
    ./autocommands.nix
    ./keymaps.nix
    ./options.nix
    ./plugins/home.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.mimeApps = {
    defaultApplications = {
      "text/markdown" = [ "nvim.desktop" ]; # markdown
      "text/plain" = [ "nvim.desktop" ]; # plain text
      "text/html" = [ "nvim.desktop" ]; # html
      "text/css" = [ "nvim.desktop" ]; # css
      "text/vnd.trolltech.linguist" = [ "nvim.desktop" ]; # ts
      "text/csv" = [ "nvim.desktop" ]; # csv
      "application/x-subrip" = [ "nvim.desktop" ]; # srt
      "application/x-shellscript" = [ "nvim.desktop" ]; # sh
    };
  };

  # Make Neovim work with Nautilus:
  # - Terminal=false
  # - exec=kitty nvim %F
  home.file.".local/share/applications/nvim.desktop".text = ''
    [Desktop Entry]
    Name=Neovim wrapper
    GenericName=Text Editor
    TryExec=nvim
    Exec=kitty nvim %F
    Terminal=false
    Type=Application
    Keywords=Text;editor;
    Icon=nvim
    Categories=Utility;TextEditor;
    StartupNotify=false
    MimeType=text/english;text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;
  '';
}
