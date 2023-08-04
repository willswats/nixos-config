{ ... }:

{
  programs.nixvim.autoCmd = [
    {
      # Set markdown and gitcommit opts
      event = [ "FileType" ];
      pattern = [ "markdown" "gitcommit" ];
      callback = {
        __raw = ''
          function()
              vim.opt_local.wrap = true
              vim.opt_local.linebreak = true
          end'';
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
            end'';
      };
    }
  ];
}
