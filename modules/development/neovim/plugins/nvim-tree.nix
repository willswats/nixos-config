{ pkgs, config, ... }:

let
  icons = import ../icons.nix;
in
{
  home.packages = with pkgs; [
    trash-cli # Removal command in nvim-tree
  ];

  programs.nixvim = {
    keymaps =
      let
        cr = "<CR>";
        cmd = "<CMD>";

        normal =
          let
            mode = "n";
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
      config.lib.nixvim.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);

    plugins.nvim-tree = {
      enable = true;
      settings = {
        disable_netrw = false; # Don't disableNetrw (breaks gx)
        hijack_cursor = true; # Keep the cursor on the first letter of the filename
        sync_root_with_cwd = true; # Changes the tree root directory on DirChanged and refreshes the tree
        respect_buf_cwd = true; # Will change cwd of nvim-tree to that of new buffer’s when opening nvim-tree
        actions.change_dir = {
          enable = true;
          global = true; # Use :cd instead of :lcd when changing directories
        };
        update_focused_file = {
          enable = true;
          update_root = true; # Update the root directory of the tree if the file is not under current root directory
        };
        trash.cmd = "trash"; # The command used to trash items
        git.ignore = false;
        # Set as floating
        view = {
          float = {
            enable = true;
            open_win_config = {
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
                arrow_closed = icons.ui.ChevronShortDown;
                arrow_open = icons.ui.ChevronShortUp;
                default = icons.ui.Folder;
                open = icons.ui.FolderOpen;
                empty = icons.ui.EmptyFolder;
                empty_open = icons.ui.EmptyFolderOpen;
                symlink = icons.ui.FileSymlink;
                symlink_open = icons.ui.FileSymlink;
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
          show_on_dirs = true;
          show_on_open_dirs = true;
          icons = {
            hint = icons.diagnostics.Hint;
            info = icons.diagnostics.Information;
            warning = icons.diagnostics.Warning;
            error = icons.diagnostics.Error;
          };
        };
        # Set custom mappings
        on_attach = {
          __raw = ''
            function(bufnr)
              local api = require('nvim-tree.api')

              local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
              end

              api.config.mappings.default_on_attach(bufnr)

              vim.keymap.set('n', 'L', api.tree.change_root_to_node, opts('CD'))
              vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
              vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
              vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
              vim.keymap.set('n', 'd', api.fs.trash, opts('Trash')) 
              vim.keymap.set('n', 'c', api.fs.copy.filename, opts('Copy Name'))
              vim.keymap.set('n', 'C', api.fs.copy.relative_path, opts('Copy Relative Path'))
              vim.keymap.set('n', 'y', api.fs.copy.node, opts('Copy'))
            end
          '';
        };
      };
    };
  };
}
