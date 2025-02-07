{ globals, pkgs, ... }:


let
  home = globals.directories.home;
in
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
    style = ''
      * {
      	background-image: none;
      	box-shadow: none;
      }

      window {
      	background-color: rgba(30, 30, 46, 0.90);
      }

      button {
      	border-radius: 0;
      	border-color: #89b4fa;
      	text-decoration-color: #cdd6f4;
      	color: #cdd6f4;
      	background-color: #181825;
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
