{ globals, inputs, pkgs, ... }:

{
  home.packages = with pkgs; [ ripdrag ];

  xdg.mimeApps = {
    defaultApplications = {
      "inode/directory" = [ "yazi.desktop" ]; # Directories
    };
  };

  # Currently not included with the nix package
  # Added kitty and set Terminal=false as it does not open inode/directory otherwise (tested with Steam)
  home.file.".local/share/icons/yazi.png".source = ./yazi.png;
  home.file.".local/share/applications/yazi.desktop".text =
    ''
      [Desktop Entry]
      Name=Yazi
      Icon=yazi
      Comment=Blazing fast terminal file manager written in Rust, based on async I/O
      Terminal=false
      TryExec=yazi
      Exec=kitty yazi %u
      Type=Application
      MimeType=inode/directory
      Categories=Utility;Core;System;FileTools;FileManager;ConsoleOnly
      Keywords=File;Manager;Explorer;Browser;Launcher
    '';

  programs.yazi =
    let
      driveDir = globals.directories.drive;
    in
    {
      enable = true;
      package = inputs.yazi.packages.${pkgs.system}.yazi;
      enableBashIntegration = true;
      enableFishIntegration = true;
      keymap = {
        manager.prepend_keymap = [
          # Open shell
          {
            on = [ "<C-s>" ];
            run = ''
              shell "$SHELL" --block --confirm
            '';
            desc = "Open shell here";
          }
          # Yank into system clipboard
          {
            on = [ "y" ];
            run = [
              "yank"
              ''
                shell --confirm 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list'
              ''
            ];
          }
          # Enter a directory or open the file
          {
            on = [ "l" ];
            run = "plugin --sync smart-enter";
            desc = "Enter the child directory, or open the file";
          }
          # Overwrites "go to temp directory"
          {
            on = [ "g" "t" ];
            run = "cd ~/.local/share/Trash/files";
            desc = "Go to trash directory";
          }
        ];
        manager.append_keymap = [
          {
            on = [ "g" "p" ];
            run = "cd ~/Pictures";
            desc = "Go to the pictures directory";
          }
          {
            on = [ "g" "v" ];
            run = "cd ~/Videos";
            desc = "Go to the videos directory";
          }
          {
            on = [ "g" "l" ];
            run = "cd ~/.local";
            desc = "Go to the local directory";
          }
          {
            on = [ "g" "D" ];
            run = "cd ${driveDir}";
            desc = "Go to Drive directory";
          }
          {
            on = [ "g" "C" ];
            run = "cd ~/Code";
            desc = "Go to Code directory";
          }
          {
            on = [ "g" "U" ];
            run = "cd ${driveDir}/Work/Education/University";
            desc = "Go to University directory";
          }
        ];
      };
    };

  # Enter a directory or open the file plugin
  xdg.configFile."yazi/plugins/smart-enter.yazi/init.lua" = {
    text = ''
      return {
      	entry = function()
      		local h = cx.active.current.hovered
      		ya.manager_emit(h and h.cha.is_dir and "enter" or "open", {})
      	end,
      }
    '';
  };

  # https://github.com/catppuccin/yazi/blob/main/themes/mocha.toml
  xdg.configFile."yazi/theme.toml" = {
    text = ''
      [manager]
      cwd = { fg = "#94e2d5" }

      # Hovered
      hovered         = { fg = "#1e1e2e", bg = "#89b4fa" }
      preview_hovered = { underline = true }

      # Find
      find_keyword  = { fg = "#f9e2af", italic = true }
      find_position = { fg = "#f5c2e7", bg = "reset", italic = true }

      # Marker
      marker_copied   = { fg = "#a6e3a1", bg = "#a6e3a1" }
      marker_cut      = { fg = "#f38ba8", bg = "#f38ba8" }
      marker_selected = { fg = "#89b4fa", bg = "#89b4fa" }

      # Tab
      tab_active   = { fg = "#1e1e2e", bg = "#cdd6f4" }
      tab_inactive = { fg = "#cdd6f4", bg = "#45475a" }
      tab_width    = 1

      # Count
      count_copied   = { fg = "#1e1e2e", bg = "#a6e3a1" }
      count_cut      = { fg = "#1e1e2e", bg = "#f38ba8" }
      count_selected = { fg = "#1e1e2e", bg = "#89b4fa" }

      # Border
      border_symbol = "│"
      border_style  = { fg = "#7f849c" }

      # Highlighting
      syntect_theme = "~/.config/yazi/Catppuccin-mocha.tmTheme"

      [status]
      separator_open  = ""
      separator_close = ""
      separator_style = { fg = "#45475a", bg = "#45475a" }

      # Mode
      mode_normal = { fg = "#1e1e2e", bg = "#89b4fa", bold = true }
      mode_select = { fg = "#1e1e2e", bg = "#a6e3a1", bold = true }
      mode_unset  = { fg = "#1e1e2e", bg = "#f2cdcd", bold = true }

      # Progress
      progress_label  = { fg = "#ffffff", bold = true }
      progress_normal = { fg = "#89b4fa", bg = "#45475a" }
      progress_error  = { fg = "#f38ba8", bg = "#45475a" }

      # Permissions
      permissions_t = { fg = "#89b4fa" }
      permissions_r = { fg = "#f9e2af" }
      permissions_w = { fg = "#f38ba8" }
      permissions_x = { fg = "#a6e3a1" }
      permissions_s = { fg = "#7f849c" }

      [input]
      border   = { fg = "#89b4fa" }
      title    = {}
      value    = {}
      selected = { reversed = true }

      [select]
      border   = { fg = "#89b4fa" }
      active   = { fg = "#f5c2e7" }
      inactive = {}

      [tasks]
      border  = { fg = "#89b4fa" }
      title   = {}
      hovered = { underline = true }

      [which]
      mask            = { bg = "#313244" }
      cand            = { fg = "#94e2d5" }
      rest            = { fg = "#9399b2" }
      desc            = { fg = "#f5c2e7" }
      separator       = "  "
      separator_style = { fg = "#585b70" }

      [help]
      on      = { fg = "#f5c2e7" }
      exec    = { fg = "#94e2d5" }
      desc    = { fg = "#9399b2" }
      hovered = { bg = "#585b70", bold = true }
      footer  = { fg = "#45475a", bg = "#cdd6f4" }

      [filetype]

      rules = [
      	# Images
      	{ mime = "image/*", fg = "#94e2d5" },

      	# Videos
      	{ mime = "video/*", fg = "#f9e2af" },
      	{ mime = "audio/*", fg = "#f9e2af" },

      	# Archives
      	{ mime = "application/zip",             fg = "#f5c2e7" },
      	{ mime = "application/gzip",            fg = "#f5c2e7" },
      	{ mime = "application/x-tar",           fg = "#f5c2e7" },
      	{ mime = "application/x-bzip",          fg = "#f5c2e7" },
      	{ mime = "application/x-bzip2",         fg = "#f5c2e7" },
      	{ mime = "application/x-7z-compressed", fg = "#f5c2e7" },
      	{ mime = "application/x-rar",           fg = "#f5c2e7" },

      	# Fallback
      	{ name = "*", fg = "#cdd6f4" },
      	{ name = "*/", fg = "#89b4fa" }
      ]
    '';
  };
}
