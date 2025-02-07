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
          tooltip = false;
        };
      };
    };
    style =
      let
        blue = "#${globals.colours.blue}";
        mantle = "rgba(24,24,37, 0.9)";
        crust = "rgba(17, 17, 27, 0.9)";
      in
      ''
        #mode {
          color: ${blue};
          background-color: ${mantle};
          margin: 4px 2px 4px 2px;
          padding: 0 10px;
        }

        #workspaces button.focused {
          color: ${blue};
          background-color: ${crust};
        }
      '';
  };
}
