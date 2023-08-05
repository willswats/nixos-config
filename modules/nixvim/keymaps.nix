{ ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";
    maps = let
      cr = "<CR>";
      cmd = "<CMD>";
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
        # Write
        "<leader>w" = {
          action = "${cmd}w!${cr}";
          silent = true;
        };
        "<leader>W" = {
          action = "${cmd}noautocmd w${cr}";
          silent = true;
        };
        # Quit
        "<leader>q" = {
          action = "${cmd}q${cr}";
          silent = true;
        };
        # Buffer delete
        "<leader>bd" = {
          action = "${cmd}confirm bd${cr}";
          silent = true;
        };
        # Remove highlight
        "<leader>h" = {
          action = "${cmd}nohlsearch${cr}";
          silent = true;
        };
        # Nvim-tree
        "<leader>e" = {
          action = "${cmd}NvimTreeToggle${cr}";
          silent = true;
        };
        # Telescope
        "<leader>ff" = {
          action = "${cmd}Telescope find_files${cr}";
          silent = true;
        };
        "<leader>ft" = {
          action = "${cmd}Telescope live_grep${cr}";
          silent = true;
        };
        "<leader>fr" = {
          action = "${cmd}Telescope resume${cr}";
          silent = true;
        };
        "<leader>fg" = {
          action = "${cmd}Telescope git_files${cr}";
          silent = true;
        };
        # Bufferline
        "<S-l>" = {
          action = "${cmd}BufferLineCycleNext${cr}";
          silent = true;
        };
        "<S-h>" = {
          action = "${cmd}BufferLineCyclePrev${cr}";
          silent = true;
        };
        "<A-l>" = {
          action = "${cmd}BufferLineMoveNext${cr}";
          silent = true;
        };
        "<A-h>" = {
          action = "${cmd}BufferLineMovePrev${cr}";
          silent = true;
        };
        "<leader>bh" = {
          action = "${cmd}BufferLineCloseLeft${cr}";
          silent = true;
        };
        "<leader>bl" = {
          action = "${cmd}BufferLineCloseRight${cr}";
          silent = true;
        };
        # ToggleTerm
        "<leader>t1" = {
          action = "${cmd}ToggleTerm 1${cr}";
          silent = true;
        };
        "<leader>t2" = {
          action = "${cmd}ToggleTerm 2${cr}";
          silent = true;
        };
        "<leader>t3" = {
          action = "${cmd}ToggleTerm 3${cr}";
          silent = true;
        };
        "<leader>t4" = {
          action = "${cmd}ToggleTerm 4${cr}";
          silent = true;
        };
        "<leader>t5" = {
          action = "${cmd}ToggleTerm 5${cr}";
          silent = true;
        };
        "<leader>t6" = {
          action = "${cmd}ToggleTerm 6${cr}";
          silent = true;
        };
        "<leader>t7" = {
          action = "${cmd}ToggleTerm 7${cr}";
          silent = true;
        };
        "<leader>t8" = {
          action = "${cmd}ToggleTerm 8${cr}";
          silent = true;
        };
        "<leader>t9" = {
          action = "${cmd}ToggleTerm 9${cr}";
          silent = true;
        };
        "<leader>t0" = {
          action = "${cmd}ToggleTerm 10${cr}";
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
