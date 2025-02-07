{ globals, pkgs, ... }:

{
  xdg.configFile."wlogout/icons".source = ./icons;

  programs.wlogout = {
    enable = true;
    package = pkgs.wleave;
    layout = [
      {
        label = "lock";
        action = "loginctl lock-session";
        text = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "logout";
        "action" = "loginctl terminate-user $USER";
        "text" = "Exit";
        "keybind" = "e";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
        "keybind" = "s";
      }
      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Power off";
        "keybind" = "p";
      }
    ];
    # https://github.com/catppuccin/wlogout
    style =
      let
        home = globals.directories.home;

        base = globals.colours.base;
        blue = globals.colours.blue;
        text = globals.colours.text;
        mantle = globals.colours.mantle;
      in
      ''
        * {
        	background-image: none;
        	box-shadow: none;
        }

        window {
        	background-color: #${base};
        }

        button {
        	border-radius: 0;
        	border-color: #${blue};
        	text-decoration-color: #${text};
        	color: #${text};
        	background-color: #${mantle};
        	border-style: solid;
        	border-width: 1px;
        	background-repeat: no-repeat;
        	background-position: center;
          background-size: 25%;
        }

        #lock {
          background-image: url("${home}/.config/wlogout/icons/lock.svg");
        }

        #logout {
          background-image: url("${home}/.config/wlogout/icons/logout.svg");
        }

        #suspend {
          background-image: url("${home}/.config/wlogout/icons/suspend.svg");
        }

        #hibernate {
          background-image: url("${home}/.config/wlogout/icons/hibernate.svg");
        }

        #shutdown {
          background-image: url("${home}/.config/wlogout/icons/shutdown.svg");
        }

        #reboot {
          background-image: url("${home}/.config/wlogout/icons/reboot.svg");
        }
      '';
  };
}
