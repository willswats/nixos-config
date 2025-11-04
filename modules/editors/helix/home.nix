{ ... }:

{
  # Note: a lot of the lsp config is only defined for the sake of adding scls to the language servers list, and to define the snippets for scls.
  # We also have to define them to add "auto-format = true" to the servers where it is not the default. 
  imports = [
    ./lsp/scls.nix
    ./lsp/nix.nix
    ./lsp/web.nix
    ./lsp/svelte.nix
    ./lsp/prisma.nix
    ./lsp/taplo.nix
    ./lsp/markdown.nix
    ./lsp/python.nix
    ./lsp/rust.nix
    ./lsp/godot.nix
    ./lsp/c.nix
    ./lsp/c-sharp.nix
    ./lsp/lua.nix
    ./lsp/bash.nix
    ./lsp/sql.nix
  ];

  xdg.mimeApps = {
    defaultApplications = {
      "text/markdown" = [ "helix.desktop" ]; # markdown
      "text/plain" = [ "helix.desktop" ]; # plain text
      "text/html" = [ "helix.desktop" ]; # html
      "text/css" = [ "helix.desktop" ]; # css
      "text/vnd.trolltech.linguist" = [ "helix.desktop" ]; # ts
      "text/csv" = [ "helix.desktop" ]; # csv
      "application/x-subrip" = [ "helix.desktop" ]; # srt
      "application/x-shellscript" = [ "helix.desktop" ]; # sh
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        cursorline = true; # Highlight current line
        cursor-shape.insert = "bar"; # Change to bar in insert
        bufferline = "multiple"; # Show bufferline when multiple buffers
        rainbow-brackets = true; # Rainbow brackets
        line-number = "relative"; # Relative line numbers
        indent-guides.render = true; # Indent guides
        scrolloff = 8; # How many lines to before scrolling starts
        inline-diagnostics.cursor-line = "disable";
        end-of-line-diagnostics = "disable";

        # Completion
        completion-timeout = 5; # Time in milliseconds after typing a word character before completions are shown, 5 is instant
        completion-trigger-len = 1; # Min-length of word under cursor to trigger autocompletion
        word-completion.trigger-length = 1; # Number of word characters to type before triggering completion

        # Status line
        color-modes = true; # Coloured modes in statusline
        statusline = {
          left = [
            "mode"
            "spacer"
            "version-control"
            "spacer"
            "diagnostics"
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          right = [
            "file-encoding"
            "file-type"
            "position-percentage"
            "position"
          ];
        };
      };
      keys = {
        insert = {
          j.k = "normal_mode";
          k.j = "normal_mode";
        };
        normal = {
          # Note: it's not currently possible to format and then write in this command as it doesn't block write from happening until format is complete.
          # Could be fixed by: https://github.com/helix-editor/helix/issues/8853
          space.w = [
            ":w"
          ];
          space.W = ":w --no-format";
          space.q = ":q";
          space.c = ":bc";
          space.C = ":bco";
          space.x = ":reset-diff-change";
          space.m = ":lsp-workspace-command open-preview"; # mpls lsp - open markdown preview
          C-r = ":reload-all";
          # Yazi integration - https://github.com/helix-editor/helix/discussions/12934#discussioncomment-12438498
          C-e =
            let
              echo = ''
                \x1b[?1049h\x1b[?2004h
              '';
            in
            [
              ":sh rm -f /tmp/unique-file"
              ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
              ":insert-output echo '${echo}' > /dev/tty"
              ":open %sh{cat /tmp/unique-file}"
              ":redraw"
            ];
          # More intuitive x and X motions - https://helix-editor.vercel.app/help/recipes#more-intuitive-x-and-x-motions
          x = "select_line_below";
          X = "select_line_above";
        };
      };
    };
  };
}
