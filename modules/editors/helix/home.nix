{ ... }:

{
  # Note: a lot of the lsp config is only defined for the sake of adding scls to the language servers list, and to define the snippets for scls.
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
        bufferline = "multiple";
        cursorline = true;
        cursor-shape.insert = "bar";
        indent-guides.render = true;
        completion-timeout = 5;
        statusline = {
          left = [
            "mode"
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
          space.w = [
            ":w"
            ":format"
          ];
          space.W = ":w --no-format";
          space.q = ":q";
          space.c = ":bc";
          space.C = ":bco";
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

  # https://helix-editor.vercel.app/reference/language-servers
  xdg.configFile."helix/languages.toml".text = '''';
}
