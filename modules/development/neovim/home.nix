{ ... }:

{
  imports = [
    ./colorscheme.nix
    ./autocommands.nix
    ./keymaps.nix
    ./options.nix
    ./plugins/plugins.nix
  ];

  programs.nixvim.enable = true;
}