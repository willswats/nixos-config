{ globals, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ ripdrag ];

  programs.yazi =
    let
      driveDir = globals.directories.drive;
    in
    {
      enable = true;
      package = inputs.yazi.packages.${pkgs.system}.default;
      catppuccin.enable = true;
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

  # Enable built-in session plugin to allow yanking between terminals
  xdg.configFile."yazi/init.lua" = {
    text = ''
      require("session"):setup {
      	sync_yanked = true,
      }
    '';
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
}
