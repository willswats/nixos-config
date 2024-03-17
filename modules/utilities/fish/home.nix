{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [ fish ];

  programs.fish = {
    enable = true;
    shellAliases =
      let
        driveDir = globals.directories.drive;
        notebookDirectory = "${driveDir}/Work/Notebook";
        universityDirectory = "${driveDir}/Work/Education/University";

        codeDirectory = "~/Code";
        nixosConfigDirectory = "~/Code/nixos-config";

        desktopHostName = globals.hostNames.desktop;
        laptopHostName = globals.hostNames.laptop;

        notifySend = "${pkgs.libnotify}/bin/notify-send";
        hostname = "${pkgs.hostname}/bin/hostname";

        # Rebuild command that's dependent upon the host name for choosing the flake
        rebuildSwitchFlake = pkgs.writeShellScript "rebuildSwitchFlake.sh" ''
          rebuild_switch_command() {
            sudo nixos-rebuild switch --flake ${nixosConfigDirectory}"$1"
          }

          rebuild_switch_flake() {
            ${notifySend} "$1 - Starting Flake Rebuild..."
            if rebuild_switch_command "$2"; then
              ${notifySend} "$1 - Flake Rebuild Completed"
            else
              ${notifySend} "$1 - Flake Rebuild Failed"
            fi
          }

          host=$(${hostname})
          if [ "$host" = "${desktopHostName}" ]; then
            rebuild_switch_flake "${desktopHostName}" "#desktop"
          elif [ "$host" = "${laptopHostName}" ]; then
            rebuild_switch_flake "${laptopHostName}" "#laptop"
          fi
        '';
      in
      {
        c = "clear";
        nv = "nvim";
        lg = "lazygit";

        uni = "cd ${universityDirectory}";
        code = "cd ${codeDirectory}";
        conf = "cd ${nixosConfigDirectory}; nvim";
        note = "cd ${notebookDirectory}; nvim ${notebookDirectory}/1-ToDo/1-Today.md";

        rsf = rebuildSwitchFlake.outPath;
        prsf = "git -C ${nixosConfigDirectory} pull; ${rebuildSwitchFlake.outPath}";
        fursf = "sudo nix flake update ${nixosConfigDirectory}; git -C ${nixosConfigDirectory} add flake.lock; ${rebuildSwitchFlake.outPath}";
        nix-shell = "nix-shell --command fish";

        backup = "config-backup-cli ${driveDir}/Games/Backups/";
      };
    interactiveShellInit = ''
      # Hide fish greeting
      set -g fish_greeting

      # Set vi key bindings
      set -g fish_key_bindings fish_vi_key_bindings

      # Set vi cursors
      set -g fish_vi_force_cursor 1 
      set -g fish_cursor_default block
      set -g fish_cursor_insert line
      set -g fish_cursor_replace_one underscore
      set -g fish_cursor_replace underscore
      set -g fish_cursor_external line

      # Binds "jk" to switch to normal mode in vi-mode
      bind -M insert -m default jk cancel repaint-mode

      # Copy to clipboard with vi key bindings
      bind yy fish_clipboard_copy
      bind Y fish_clipboard_copy
      bind p fish_clipboard_paste

      # Make fish wait 500ms for the "k"
      set -g fish_sequence_key_delay_ms 500

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
