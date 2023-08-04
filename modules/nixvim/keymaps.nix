{ ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";
    maps = {
      normal = {
        # Better window navigation
        "<C-h>" = {
          action = "<C-w>h";
          silent = true;
        };
        "<C-j>" = {
          action = "<C-w>j";
          silent = true;
        };
        "<C-k>" = {
          action = "<C-w>k";
          silent = true;
        };
        "<C-l>" = {
          action = "<C-w>l>";
          silent = true;
        };
      };
    };
  };
}
