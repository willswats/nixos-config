{ host, pkgs, ... }:

{
  home.packages = with pkgs; [
    file-roller
  ];

  catppuccin.yazi.enable = true;
  programs.yazi =
    let
      driveDir = host.directories.drive;

      nautilus = "${pkgs.nautilus}/bin/nautilus";
      fileRoller = "${pkgs.file-roller}/bin/file-roller";

      # Pinned to commit so that I do not need to keep updating the hash
      # https://github.com/yazi-rs/plugins/tree/main
      yazi-plugins = pkgs.fetchFromGitHub {
        owner = "yazi-rs";
        repo = "plugins";
        rev = "ec97f8847feeb0307d240e7dc0f11d2d41ebd99d"; # 2024-12-11
        hash = "sha256-By8XuqVJvS841u+8Dfm6R8GqRAs0mO2WapK6r2g7WI8=";
      };
    in
    {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      shellWrapperName = "y";

      keymap = {
        manager.prepend_keymap = [
          # Open nautilus 
          {
            on = [ "<C-o>" ];
            run = ''
              shell '${nautilus} .'
            '';
          }
          # Open file roller compress menu with selected files
          {
            on = [ "<C-i>" ];
            run = ''
              shell '${fileRoller} --add "$@" -x 2>/dev/null &'
            '';
          }
          # Open shell
          {
            on = [ "<C-s>" ];
            run = ''
              shell "$SHELL" --block
            '';
            desc = "Open shell here";
          }
          # Yank into system clipboard
          {
            on = [ "y" ];
            run = [
              "yank"
              ''
                shell 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list'
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
            run = "plugin smart-enter";
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
          # extract zip instead of open
          {
            name = "*.zip";
            use = [ "extract" ];
          }
        ];
      };

      # Plugins found here - https://github.com/yazi-rs/plugins
      plugins = {
        chmod = "${yazi-plugins}/chmod.yazi";
        smart-enter = "${yazi-plugins}/smart-enter.yazi";
      };

      # Some plugins need to be required
      # session - built-in session plugin to allow yanking between terminals
      initLua = ''
        require("session"):setup {
          sync_yanked = true,
        }
      '';
    };
}
