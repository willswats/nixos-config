{ globals, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-left = [ "hyprland/workspaces" "hyprland/window" "hyprland/submap" ];

        "hyprland/workspaces" = {
          all-outputs = false;
        };

        "hyprland/window" = {
          max-length = 40;
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
        #submap {
          color: ${blue};
          background-color: ${mantle};
          border-radius: 5px;
          margin: 4px 2px 4px 2px;
          padding: 0 10px;
        } 

        #workspaces button {
          padding: 8px;
        }

        #workspaces button.active {
          color: ${blue};
          background-color: ${crust};
        }
      '';
  };
}
