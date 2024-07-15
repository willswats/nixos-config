{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [ fish ];

  programs.fish = {
    enable = true;
    catppuccin.enable = true;
    shellAliases =
      let
        driveDir = globals.directories.drive;
        notebookDirectory = "${driveDir}/Work/Notebook";
        universityDirectory = "${driveDir}/Work/Education/University";

        codeDirectory = "~/Code";
        nixosConfigDirectory = "~/Code/nixos-config";
        nixosShellsDirectory = "${nixosConfigDirectory}/shells";

        desktopHostName = globals.hostNames.desktop;
        laptopHostName = globals.hostNames.laptop;

        ytDlp = "${pkgs.yt-dlp}/bin/yt-dlp";
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
        # Shortened
        c = "clear";
        nv = "nvim";
        lg = "lazygit";

        # CD
        uni = "cd ${universityDirectory}";
        code = "cd ${codeDirectory}";
        conf = "cd ${nixosConfigDirectory}; nvim";
        note = "cd ${notebookDirectory}; nvim ${notebookDirectory}/1-ToDo/1-Today.md";

        # Nix Rebuild
        rsf = rebuildSwitchFlake.outPath;
        prsf = "git -C ${nixosConfigDirectory} pull; ${rebuildSwitchFlake.outPath}";
        fursf = "sudo nix flake update ${nixosConfigDirectory}; git -C ${nixosConfigDirectory} add flake.lock; ${rebuildSwitchFlake.outPath}";

        # Nix Shells
        nix-shell = "nix-shell --command fish";
        nsnode = "nix-shell ${nixosShellsDirectory}/node.nix";
        nspython = "nix-shell ${nixosShellsDirectory}/python.nix";
        nsdotnet = "nix-shell ${nixosShellsDirectory}/dotnet.nix";
        nsrust = "nix-shell ${nixosShellsDirectory}/rust.nix";
        nsflutter = "nix-shell ${nixosShellsDirectory}/flutter.nix";
        nshaskell = "nix-shell ${nixosShellsDirectory}/haskell.nix";

        # yt-dlp
        dlmp3 = "${ytDlp} -x --audio-format mp3";
        dlmp4 = "${ytDlp} -f mp4";
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
    '';
  };
}
