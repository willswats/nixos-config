{ ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";
    maps = let cr = "<CR>";
    in {
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
          action = "<C-w>l";
          silent = true;
        };
        # Resize with arrow keys
        "<C-Up>" = {
          action = ":resize +2${cr}";
          silent = true;
        };
        "<C-Down>" = {
          action = ":resize -2${cr}";
          silent = true;
        };
        "<C-Left>" = {
          action = ":vertical resize -2${cr}";
          silent = true;
        };
        "<C-Right>" = {
          action = ":vertical resize +2${cr}";
          silent = true;
        };
      };
      insert = {
        # Escape insert mode faster
        "jk" = {
          action = "<ESC>";
          silent = true;
        };
        "kj" = {
          action = "<ESC>";
          silent = true;
        };
      };
      visual = {
        # Stay in indent mode 
        "<" = {
          action = "<gv";
          silent = true;
        };
        ">" = {
          action = ">gv";
          silent = true;
        };
      };
      terminal = {
        # Better terminal navigation 
        "<C-h>" = {
          action = "<C-\\><C-N><C-w>h";
          silent = true;
        };
        "<C-j>" = {
          action = "<C-\\><C-N><C-w>j";
          silent = true;
        };
        "<C-k>" = {
          action = "<C-\\><C-N><C-w>k";
          silent = true;
        };
        "<C-l>" = {
          action = "<C-\\><C-N><C-w>h";
          silent = true;
        };
      };
    };
  };
}
