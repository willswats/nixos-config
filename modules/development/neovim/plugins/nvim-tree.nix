{ pkgs, config, ... }:

let icons = import ../icons.nix;
in {
  home.packages = with pkgs;
    [
      trash-cli # Removal command in nvim-tree
    ];

  programs.nixvim = {
    keymaps =
      let
        cr = "<CR>";
        cmd = "<CMD>";

        normal =
          let mode = "n";
          in
          [
            {
              inherit mode;
              key = "<leader>e";
              action = "${cmd}NvimTreeToggle${cr}";
              options.desc = "Explorer";
            }
          ];
      in
      config.nixvim.helpers.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);

    plugins.nvim-tree = {
      enable = true;
      disableNetrw = true; # Disable default neovim explorer
      hijackCursor = true; # Keep the cursor on the first letter of the filename
      syncRootWithCwd =
        true; # Changes the tree root directory on DirChanged and refreshes the tree
      respectBufCwd = true; # Will change cwd of nvim-tree to that of new buffer’s when opening nvim-tree
      actions.changeDir = {
        enable = true;
        global = true; # Use :cd instead of :lcd when changing directories
      };
      updateFocusedFile = {
        enable = true;
        updateRoot = true; # Update the root directory of the tree if the file is not under current root directory
      };
      trash.cmd = "trash"; # The command used to trash items
      git.ignore = false;
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
      diagnostics = {
        enable = true;
        showOnDirs = true;
        showOnOpenDirs = true;
        icons = {
          hint = icons.diagnostics.Hint;
          info = icons.diagnostics.Information;
          warning = icons.diagnostics.Warning;
          error = icons.diagnostics.Error;
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
            vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
            vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
            vim.keymap.set('n', 'd', api.fs.trash, opts('Trash'))
          end
        '';
      };
    };
  };
}
