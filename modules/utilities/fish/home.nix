{
  pkgs,
  globals,
  host,
  ...
}:

{
  home.packages = with pkgs; [ fish ];

  catppuccin.fish.enable = true;
  programs.fish = {
    enable = true;
    shellAliases =
      let
        driveDir = host.directories.drive;
        notebookDirectory = "${driveDir}/Notebook";
        universityDirectory = "${driveDir}/Work/Education/University";

        codeDirectory = "~/Code";
        nixosConfigDirectory = "~/Code/nixos-config";

        desktopHostName = globals.hostNames.desktop;
        laptopHostName = globals.hostNames.laptop;

        ytDlp = "${pkgs.yt-dlp}/bin/yt-dlp";
        notifySend = "${pkgs.libnotify}/bin/notify-send";
        hostname = "${pkgs.hostname}/bin/hostname";

        # Rebuild command that's dependent upon the host name for choosing the flake
        rebuildSwitchFlake = pkgs.writeShellScript "rebuildSwitchFlake.sh" ''
          rebuild_switch_command() {
            sudo nixos-rebuild switch --option eval-cache false --accept-flake-config --flake ${nixosConfigDirectory}"$1"
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

        # Close issue as completed with a comment referencing the last commit.
        gh = "${pkgs.gh}/bin/gh";
        git = "${pkgs.git}/bin/git";
        ghIssueCloseCommit = pkgs.writeShellScript "ghIssueCloseCommit.sh" ''
          ${gh} issue close "$1" -r "completed" --comment "Closed by $(${git} log -1 --pretty=format:%H)."
        '';
      in
      {
        c = "clear";
        nv = "nvim";
        lg = "lazygit";

        # CD
        cduni = "cd ${universityDirectory}";
        cdcode = "cd ${codeDirectory}";
        # nvim
        nvconf = "cd ${nixosConfigDirectory}; nvim";
        nvnote = "cd ${notebookDirectory}; nvim ${notebookDirectory}/1-ToDo/1-Today.md";

        # gh
        ghicc = ghIssueCloseCommit.outPath;

        # yt-dlp
        dlmp3 = "${ytDlp} -x --audio-format mp3";
        dlmp4 = "${ytDlp} -f mp4";

        # Nix
        nix-shell = "nix-shell --command fish";
        rsf = rebuildSwitchFlake.outPath;

        # lynx
        lynx = "lynx -vikeys";
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
