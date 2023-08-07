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
          # Better window navigation
          "<C-h>".action = "<C-w>h";
          "<C-j>".action = "<C-w>j";
          "<C-k>".action = "<C-w>k";
          "<C-l>".action = "<C-w>l";
          # Resize with arrow keys
          "<C-Up>".action = ":resize +2${cr}";
          "<C-Down>".action = ":resize -2${cr}";
          "<C-Left>".action = ":vertical resize -2${cr}";
          "<C-Right>".action = ":vertical resize +2${cr}";
          # Write
          "<leader>w".action = "${cmd}w!${cr}";
          "<leader>W".action = "${cmd}noautocmd w${cr}";
          # Quit
          "<leader>q".action = "${cmd}q${cr}";
          # Buffer delete
          "<leader>bd".action = "${cmd}confirm bd${cr}";
          # Remove highlight
          "<leader>h".action = "${cmd}nohlsearch${cr}";
        };
        insert = {
          # Escape insert mode faster
          "jk".action = "<ESC>";
          "kj".action = "<ESC>";
        };
        visual = {
          # Stay in indent mode 
          "<".action = "<gv";
          ">".action = ">gv";
        };
        terminal = {
          # Better terminal navigation 
          "<C-h>".action = "<C-\\><C-N><C-w>h";
          "<C-j>".action = "<C-\\><C-N><C-w>j";
          "<C-k>".action = "<C-\\><C-N><C-w>k";
          "<C-l>".action = "<C-\\><C-N><C-w>h";
        };
      };
  };
}
