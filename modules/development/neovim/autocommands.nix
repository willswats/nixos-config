{ ... }:

{
  programs.nixvim.autoCmd = [
    {
      # Set q to close certain buffers
      event = "FileType";
      pattern = [ "qf" "help" "man" "lspinfo" "lsp-installer" "null-ls-info" ];
      callback = {
        __raw = ''
          function()
            vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
            vim.opt_local.buflisted = false
          end
        '';
      };
    }
    {
      # Set markdown and gitcommit opts
      event = [ "FileType" ];
      pattern = [ "markdown" "gitcommit" ];
      callback = {
        __raw = ''
          function()
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true
            vim.opt_local.spell = true
          end
        '';
      };
    }
    # Show highlight on yank
    {
      event = [ "TextYankPost" ];
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
          end
        '';
      };
    }
    # Auto format on write
    {
      event = [ "BufWritePre" ];
      callback = {
        __raw = ''
          function()
            vim.lsp.buf.format({ async = false })
          end
        '';
      };
    }
    # Set shiftwidth for sql and cs files (default is 2)
    {
      event = [ "FileType" ];
      pattern = [ "sql" "cs" ];
      callback = {
        __raw = ''
          function()
            vim.opt_local.shiftwidth = 4
          end
        '';
      };
    }
  ];
}
