{ pkgs, ... }:

{
  home.packages = with pkgs;
    [
      ueberzugpp
    ];

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    keymap = {
      manager.prepend_keymap = [
        # Close tab to the right of the current one to not lose position
        {
          on = [ "T" ];
          exec = "tab_close 1";
        }
        # Open shell
        {
          on = [ "<C-s>" ];
          exec = "shell \"$SHELL\" --block --confirm";
          desc = "Open shell here";
        }
        # Yank into system clipboard
        {
          on = [ "y" ];
          exec = [ "yank" "shell --confirm 'for path in \"$@\"; do echo \"file://$path\"; done | wl-copy -t text/uri-list'" ];
        }
        # Enter a directory or open the file
        {
          on = [ "l" ];
          exec = "plugin --sync smart-enter";
          desc = "Enter the child directory, or open the file";
        }
        # Overwrites "go to temp directory"
        {
          on = [ "g" "t" ];
          exec = "cd ~/.local/share/Trash/files";
          desc = "Go to trash directory";
        }
      ];
      manager.append_keymap = [
        {
          on = [ "g" "u" ];
          exec = "cd ~/Dropbox/Work/Education/University";
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
}
