{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [ lazygit ];

  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        disableForcePushing = true; # To ensure that a force push is not fat fingered
        overrideGpg = true; # To not get booted to shell on each commit
      };
      gui.theme =
        let
          red = "#${globals.colours.red}";
          yellow = "#${globals.colours.yellow}";
          blue = "#${globals.colours.blue}";
          lavender = "#${globals.colours.lavender}";
          text = "#${globals.colours.text}";
          subtext0 = "#${globals.colours.subtext0}";
          surface0 = "#${globals.colours.surface0}";
          surface1 = "#${globals.colours.surface1}";
        in
        {
          activeBorderColor = [
            "${blue}"
            "bold"
          ];
          inactiveBorderColor = [ "${subtext0}" ];
          optionsTextColor = [ "${blue}" ];
          selectedLineBgColor = [ "${surface0}" ];
          cherryPickedCommitBgColor = [ "${surface1}" ];
          cherryPickedCommitFgColor = [ "${blue}" ];
          unstagedChangesColor = [ "${red}" ];
          defaultFgColor = [ "${text}" ];
          searchingActiveBorderColor = [ "${yellow}" ];
          authorColors = [ "#${lavender}" ];
        };
    };
  };
}
