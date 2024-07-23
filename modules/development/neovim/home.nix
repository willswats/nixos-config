{ inputs, pkgs, ... }:

{
  imports = [
    ./autocommands.nix
    ./keymaps.nix
    ./options.nix
    ./plugins/home.nix
  ];

  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
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
    };
  };
}
