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
      in
      ''
        #submap {
          color: ${blue};
          background-color: ${mantle};
        } 
      '';
  };
}
