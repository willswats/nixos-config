{ config, ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";
    maps = let
      cr = "<CR>";
      cmd = "<CMD>";
    in config.nixvim.helpers.mkMaps { silent = true; } {
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
        # Nvim-tree
        "<leader>e".action = "${cmd}NvimTreeToggle${cr}";
        # Telescope
        "<leader>ff".action = "${cmd}Telescope find_files${cr}";
        "<leader>ft".action = "${cmd}Telescope live_grep${cr}";
        "<leader>fr".action = "${cmd}Telescope resume${cr}";
        "<leader>fg".action = "${cmd}Telescope git_files${cr}";
        # Bufferline
        "<S-l>".action = "${cmd}BufferLineCycleNext${cr}";
        "<S-h>".action = "${cmd}BufferLineCyclePrev${cr}";
        "<A-l>".action = "${cmd}BufferLineMoveNext${cr}";
        "<A-h>".action = "${cmd}BufferLineMovePrev${cr}";
        "<leader>bh".action = "${cmd}BufferLineCloseLeft${cr}";
        "<leader>bl".action = "${cmd}BufferLineCloseRight${cr}";
        # ToggleTerm
        "<leader>t1".action = "${cmd}ToggleTerm 1${cr}";
        "<leader>t2".action = "${cmd}ToggleTerm 2${cr}";
        "<leader>t3".action = "${cmd}ToggleTerm 3${cr}";
        "<leader>t4".action = "${cmd}ToggleTerm 4${cr}";
        "<leader>t5".action = "${cmd}ToggleTerm 5${cr}";
        "<leader>t6".action = "${cmd}ToggleTerm 6${cr}";
        "<leader>t7".action = "${cmd}ToggleTerm 7${cr}";
        "<leader>t8".action = "${cmd}ToggleTerm 8${cr}";
        "<leader>t9".action = "${cmd}ToggleTerm 9${cr}";
        "<leader>t0".action = "${cmd}ToggleTerm 10${cr}";
        "<leader>tg".action = "${cmd}lua LAZYGIT_TOGGLE()${cr}";
        # Gitsigns
        "<leader>gj".action =
          "${cmd}lua require 'gitsigns'.next_hunk({navigation_message = false})${cr}";
        "<leader>gk".action =
          "${cmd}lua require 'gitsigns'.prev_hunk({navigation_message = false})${cr}";
        "<leader>gr" = "${cmd}lua require 'gitsigns'.reset_hunk()${cr}";
        "<leader>gR" = "${cmd}lua require 'gitsigns'.reset_buffer()${cr}";
        "<leader>gs" = "${cmd}lua require 'gitsigns'.stage_hunk()${cr}";
        "<leader>gS" = "${cmd}lua require 'gitsigns'.undo_stage_hunk()${cr}";
        # LSP
        "<leader>lj".action = "${cmd}lua vim.diagnostic.goto_next()${cr}";
        "<leader>lk".action = "${cmd}lua vim.diagnostic.goto_prev()${cr}";
        "<leader>lf".action = "${cmd}lua vim.diagnostic.open_float()${cr}";
        "<leader>la".action = "${cmd}lua vim.lsp.buf.code_action()${cr}";
        "<leader>li".action = "${cmd}lua vim.lsp.buf.implementation()${cr}";
        "<leader>lr".action = "${cmd}lua vim.lsp.buf.references()${cr}";
        "<leader>lh".action = "${cmd}lua vim.lsp.buf.hover()${cr}";
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
