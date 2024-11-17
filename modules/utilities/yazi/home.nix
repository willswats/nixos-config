{ host, pkgs, ... }:

{
  home.packages = with pkgs; [
    file-roller
  ];

  programs.yazi =
    let
      driveDir = host.directories.drive;

      pcmanfm = "${pkgs.pcmanfm}/bin/pcmanfm";
      fileRoller = "${pkgs.file-roller}/bin/file-roller";

      yazi-plugins = pkgs.fetchFromGitHub {
        owner = "yazi-rs";
        repo = "plugins";
        rev = "932b9311a810423659dae172ff8e215366bfc631"; # 2024-10-10
        hash = "sha256-tAccywz2yPtyWGMe8Ff2VAiFFjtTn34qBP2J39H2PdA=";
      };
    in
    {
      enable = true;
      catppuccin.enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      shellWrapperName = "y";

      keymap = {
        manager.prepend_keymap = [
          # Open pcmanfm 
          {
            on = [ "<C-o>" ];
            run = ''
              shell '${pcmanfm} .' --confirm
            '';
          }
          # Open file roller compress menu with selected files
          {
            on = [ "<C-i>" ];
            run = ''
              shell '${fileRoller} --add "$@" -x 2>/dev/null &' --confirm
            '';
          }
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
          # Overwrites "go to temp directory"
          {
            on = [ "g" "t" ];
            run = "cd ~/.local/share/Trash/files";
            desc = "Go to trash directory";
          }
          # Plugin (smart-enter) - Enter a directory or open the file
          {
            on = [ "l" ];
            run = "plugin --sync smart-enter";
            desc = "Enter the child directory, or open the file";
          }
          # Plugin (chmod) - chmod selected files
          {
            on = [ "c" "m" ];
            run = "plugin chmod";
            desc = "Chmod on selected files";
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

      settings = {
        manager = {
          sort_by = "natural";
        };
        opener = {
          open = [
            # Set "orphan = true" to detach tasks from the yazi process
            {
              run = ''
                xdg-open "$@"
              '';
              desc = "Open";
              orphan = true;
            }
          ];
        };
        open.prepend_rules = [
          # open cbz instead of extracting
          {
            name = "*.cbz";
            use = [ "open" ];
          }
          # open docx instead of edit
          {
            name = "*.docx";
            use = [ "open" ];
          }
          # edit srt to prevent xdg-open getting stuck
          {
            name = "*.srt";
            use = [ "edit" ];
          }
        ];
      };

      # Plugins found here - https://github.com/yazi-rs/plugins
      plugins = {
        chmod = "${yazi-plugins}/chmod.yazi";
      };

      # Some plugins need to be required
      # session - built-in session plugin to allow yanking between terminals
      initLua = ''
        require("session"):setup {
          sync_yanked = true,
        }
      '';
    };

  # Other plugins
  # smart-enter - enter a directory or open the file
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
}
