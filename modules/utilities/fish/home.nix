{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [ fish ];

  programs.fish = {
    enable = true;
    shellAliases =
      let
        rebuildSwitchCommand = "sudo nixos-rebuild switch --flake";
        nixosConfigDirectory = "~/Code/nixos-config";
        notebookDirectory = "~/Dropbox/Work/Notebook";
      in
      {
        c = "clear";
        nv = "nvim";
        rsd = "${rebuildSwitchCommand} ${nixosConfigDirectory}#desktop";
        rsl = "${rebuildSwitchCommand} ${nixosConfigDirectory}#laptop";
        conf = "cd ${nixosConfigDirectory}; nvim";
        note = "cd ${notebookDirectory}; nvim ${notebookDirectory}/1-ToDo/1-Today.md";
      };
    interactiveShellInit = ''
      # Hide fish greeting
      set -g fish_greeting

      fish_config theme choose "Catppuccin Mocha"
    '';
  };

  # Taken from: https://github.com/catppuccin/fish/blob/main/themes/Catppuccin%20Mocha.theme
  xdg.configFile."fish/themes/Catppuccin Mocha.theme" =
    let
      flamingo = globals.colours.flamingo;
      pink = globals.colours.pink;
      red = globals.colours.red;
      maroon = globals.colours.maroon;
      peach = globals.colours.peach;
      yellow = globals.colours.yellow;
      green = globals.colours.green;
      teal = globals.colours.teal;
      blue = globals.colours.blue;
      text = globals.colours.text;
      overlay0 = globals.colours.overlay0;
      overlay1 = globals.colours.overlay1;
      surface0 = globals.colours.surface0;
    in
    {
      text = ''
        fish_color_normal ${text}
        fish_color_command ${blue}
        fish_color_param ${flamingo}
        fish_color_keyword ${red}
        fish_color_quote ${green}
        fish_color_redirection ${pink}
        fish_color_end ${peach}
        fish_color_comment ${overlay1}
        fish_color_error ${red}
        fish_color_gray ${overlay0}
        fish_color_selection --background=${surface0}
        fish_color_search_match --background=${surface0}
        fish_color_operator ${pink}
        fish_color_escape ${maroon}
        fish_color_autosuggestion ${overlay0}
        fish_color_cancel ${red}
        fish_color_cwd ${yellow}
        fish_color_user ${teal}
        fish_color_host ${blue}
        fish_color_host_remote ${green}
        fish_color_status ${red}
        fish_pager_color_progress ${overlay0}
        fish_pager_color_prefix ${pink}
        fish_pager_color_completion ${text}
        fish_pager_color_description ${overlay0}
      '';
    };
}
