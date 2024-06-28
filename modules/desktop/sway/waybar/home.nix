{ globals, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-left = [ "sway/workspaces" "sway/window" "sway/mode" ];

        "sway/workspaces" = {
          disable-scroll = true;
        };

        "sway/window" = {
          max-length = 50;
        };
      };
    };
    style =
      let
        blue = "#${globals.colours.blue}";
        crust = "rgba(17, 17, 27, 0.9)";
      in
      ''
        #workspaces button.focused {
          color: ${blue};
          background-color: ${crust};
        }
      '';
  };
}
