{ ... }:

{
  imports = [
    ./autocommands.nix
    ./keymaps.nix
    ./options.nix
    ./colorscheme.nix
    ./plugins/home.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
