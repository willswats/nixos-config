{ config, ... }:

{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    maps =
      let
        cr = "<CR>";
        cmd = "<CMD>";
      in
      config.nixvim.helpers.mkMaps { silent = true; } {
        normal = {
          # Window navigation
          "<C-h>".action = "<C-w>h";
          "<C-j>".action = "<C-w>j";
          "<C-k>".action = "<C-w>k";
          "<C-l>".action = "<C-w>l";

          # Resize with arrow keys
          "<C-Up>".action = ":resize +2${cr}";
          "<C-Down>".action = ":resize -2${cr}";
          "<C-Left>".action = ":vertical resize -2${cr}";
          "<C-Right>".action = ":vertical resize +2${cr}";

          "<leader>w" = {
            action = "${cmd}w!${cr}";
            desc = "Write format";
          };
          "<leader>W" = {
            action = "${cmd}noautocmd w${cr}";
            desc = "Write";
          };

          "<leader>q" = {
            action = "${cmd}confirm q${cr}";
            desc = "Quit";
          };

          "<leader>bd" = {
            action = "${cmd}confirm bd${cr}";
            desc = "Delete";
          };

          "<leader>h" = {
            action = "${cmd}nohlsearch${cr}";
            desc = "No highlight";
          };
        };
        insert = {
          # Escape insert mode
          "jk".action = "<ESC>";
          "kj".action = "<ESC>";
        };
        visual = {
          # Stay in indent mode 
          "<".action = "<gv";
          ">".action = ">gv";
        };
        terminal = {
          # Terminal navigation 
          "<C-h>".action = "<C-\\><C-N><C-w>h";
          "<C-j>".action = "<C-\\><C-N><C-w>j";
          "<C-k>".action = "<C-\\><C-N><C-w>k";
          "<C-l>".action = "<C-\\><C-N><C-w>h";
        };
      };
  };
}
