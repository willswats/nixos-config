{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [ bottom ];

  programs.bottom = {
    enable = true;
    settings = {
      # Taken from and converted to nix: https://github.com/catppuccin/bottom
      colors =
        let
          rosewater = globals.colours.rosewater;
          flamingo = globals.colours.flamingo;
          pink = globals.colours.pink;
          mauve = globals.colours.mauve;
          red = globals.colours.red;
          maroon = globals.colours.maroon;
          peach = globals.colours.peach;
          yellow = globals.colours.yellow;
          green = globals.colours.green;
          sky = globals.colours.sky;
          sapphire = globals.colours.sapphire;
          text = globals.colours.text;
          subtext0 = globals.colours.subtext0;
          surface2 = globals.colours.surface2;
          crust = globals.colours.crust;
        in
        {
          table_header_color = rosewater;
          all_cpu_color = rosewater;
          avg_cpu_color = maroon;
          cpu_core_colors =
            [ red peach yellow green sapphire mauve ];
          ram_color = green;
          swap_color = peach;
          rx_color = green;
          tx_color = red;
          widget_title_color = flamingo;
          border_color = surface2;
          highlighted_border_color = pink;
          text_color = text;
          graph_color = subtext0;
          cursor_color = pink;
          selected_text_color = crust;
          selected_bg_color = mauve;
          high_battery_color = green;
          medium_battery_color = yellow;
          low_battery_color = red;
          gpu_core_colors =
            [ sapphire mauve red peach yellow green ];
          arc_color = sky;
        };
    };
  };
}
