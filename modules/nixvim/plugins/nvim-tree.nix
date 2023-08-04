{ pkgs, ... }:

{
  home.packages = with pkgs;
    [
      trash-cli # Removal command in nvim-tree
    ];

  programs.nixvim.plugins.nvim-tree = { enable = true; };
}
