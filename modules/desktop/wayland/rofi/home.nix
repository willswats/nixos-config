{ pkgs, globals, ... }:

{
  programs.rofi =
    let wezterm = "${pkgs.wezterm}/bin/wezterm";
    in {
      enable = true;
      package = pkgs.rofi-wayland;
      terminal = wezterm;
      theme = "~/.config/rofi/themes/catppuccin-mocha.rasi";
      extraConfig = { show-icons = true; };
    };

  # Modified version of: https://github.com/catppuccin/rofi/blob/main/basic/.local/share/rofi/themes/catppuccin-mocha.rasi
  xdg.configFile."rofi/themes/catppuccin-mocha.rasi" =
    let
      fontName = globals.font.name;

      red = "#${globals.colours.red}";
      blue = "#${globals.colours.blue}";
      text = "#${globals.colours.text}";
      overlay0 = "#${globals.colours.overlay0}";
      base = "#${globals.colours.base}";
    in
    {
      text = ''
        * {
            bg-col: ${base};
            bg-col-light: ${base};
            border-col: ${blue};
            selected-col: ${base};
            blue: ${blue};
            fg-col: ${text};
            fg-col2: ${red};
            grey: ${overlay0};

            width: 600;
            font: "${fontName} 14";
        }

        element-text, element-icon , mode-switcher {
            background-color: inherit;
            text-color:       inherit;
        }

        window {
            height: 360px;
            border: 2px;
            border-color: @border-col;
            background-color: @bg-col;
        }

        mainbox {
            background-color: @bg-col;
        }

        inputbar {
            children: [prompt,entry];
            background-color: @bg-col;
            border-radius: 5px;
            padding: 2px;
        }

        prompt {
            background-color: @blue;
            padding: 6px;
            text-color: @bg-col;
            border-radius: 3px;
            margin: 20px 0px 0px 20px;
        }

        textbox-prompt-colon {
            expand: false;
            str: ":";
        }

        entry {
            padding: 6px;
            margin: 20px 0px 0px 10px;
            text-color: @fg-col;
            background-color: @bg-col;
        }

        listview {
            border: 0px 0px 0px;
            padding: 6px 0px 0px;
            margin: 10px 0px 0px 20px;
            columns: 2;
            lines: 5;
            background-color: @bg-col;
        }

        element {
            padding: 5px;
            background-color: @bg-col;
            text-color: @fg-col  ;
        }

        element-icon {
            size: 25px;
        }

        element selected {
            background-color:  @selected-col ;
            text-color: @fg-col2  ;
        }

        mode-switcher {
            spacing: 0;
          }

        button {
            padding: 10px;
            background-color: @bg-col-light;
            text-color: @grey;
            vertical-align: 0.5; 
            horizontal-align: 0.5;
        }

        button selected {
          background-color: @bg-col;
          text-color: @blue;
        }

        message {
            background-color: @bg-col-light;
            margin: 2px;
            padding: 2px;
            border-radius: 5px;
        }

        textbox {
            padding: 6px;
            margin: 20px 0px 0px 20px;
            text-color: @blue;
            background-color: @bg-col-light;
        }
      '';
    };
}
