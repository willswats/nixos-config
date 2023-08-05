{ pkgs, ... }:

{
  home.packages = with pkgs;
    [
      trash-cli # Removal command in nvim-tree
    ];

  programs.nixvim.plugins.nvim-tree = {
    enable = true;
    disableNetrw = true;
    hijackCursor = true;
    hijackNetrw = true;
    syncRootWithCwd = true;
    trash.cmd = "trash";
    view = {
      float = {
        enable = true;
        openWinConfig = {
          relative = "editor";
          border = "rounded";
          width = 40;
          height = 100000;
        };
      };
    };
    onAttach = {
      __raw = ''
        function(bufnr)
          local api = require('nvim-tree.api')

          local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          api.config.mappings.default_on_attach(bufnr)

          vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
          vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
          vim.keymap.set('n', '<CR>', api.tree.change_root_to_node, opts('CD'))
          vim.keymap.set('n', 'd', api.fs.trash, opts('Trash'))
        end
      '';
    };
  };
}
