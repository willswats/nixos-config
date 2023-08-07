{ ... }:

{
  programs.nixvim.plugins.comment-nvim = {
    enable = true;
    opleader = { line = "<C-c>"; };
    toggler = { line = "<C-c>"; };
  };
}
