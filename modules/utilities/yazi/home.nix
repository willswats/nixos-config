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
        {
          on = [ "T" ];
          exec = "tab_close";
        }
        {
          on = [ "<C-s>" ];
          exec = "shell \"$SHELL\" --block --confirm";
          desc = "Open shell here";
        }
        {
          on = [ "y" ];
          exec = [ "yank" "shell --confirm 'for path in \"$@\"; do echo \"file://$path\"; done | wl-copy -t text/uri-list'" ];
        }
        {
          on = [ "l" ];
          exec = "plugin --sync smart-enter";
          desc = "Enter the child directory, or open the file";
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
