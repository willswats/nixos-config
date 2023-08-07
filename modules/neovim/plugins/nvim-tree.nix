{ pkgs, ... }:

let icons = import ../icons.nix;
in {
  home.packages = with pkgs;
    [
      trash-cli # Removal command in nvim-tree
    ];

  programs.nixvim.plugins.nvim-tree = {
    enable = true;
    disableNetrw = true; # Disable default neovim explorer
    hijackCursor = true; # Keep the cursor on the first letter of the filename
    syncRootWithCwd =
      true; # Changes the tree root directory on DirChanged and refreshes the tree
    trash.cmd = "trash"; # The command used to trash items
    # Set as floating
    view = {
      float = {
        enable = true;
        openWinConfig = {
          relative = "editor";
          border = "single";
          width = 40;
          height = 100000;
        };
      };
    };
    renderer = {
      icons = {
        glyphs = {
          default = icons.ui.File;
          symlink = icons.ui.FileSymlink;
          modified = icons.ui.Circle;
          folder = {
            arrowClosed = icons.ui.ChevronShortDown;
            arrowOpen = icons.ui.ChevronShortUp;
            default = icons.ui.Folder;
            open = icons.ui.FolderOpen;
            empty = icons.ui.EmptyFolder;
            emptyOpen = icons.ui.EmptyFolderOpen;
            symlink = icons.ui.FileSymlink;
            symlinkOpen = icons.ui.FileSymlink;
          };
          git = {
            unstaged = icons.git.FileUnstaged;
            staged = icons.git.FileStaged;
            unmerged = icons.git.FileUnmerged;
            renamed = icons.git.FileRenamed;
            untracked = icons.git.FileUntracked;
            deleted = icons.git.FileDeleted;
            ignored = icons.git.FileIgnored;
          };
        };
      };
    };
    # Set custom mappings
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
