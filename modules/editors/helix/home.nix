{ ... }:

{
  imports = [
    ./lsp/completion.nix
    ./lsp/nix.nix
    ./lsp/web.nix
    ./lsp/markdown.nix
    ./lsp/python.nix
    ./lsp/rust.nix
    ./lsp/godot.nix
    ./lsp/c-sharp.nix
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
      };
      keys = {
        insert = {
          j.k = "normal_mode";
          k.j = "normal_mode";
        };
        normal = {
          space.w = ":w";
          space.q = ":q";
          space.c = ":bc";
          space.C = ":bco";
          C-r = ":reload-all";
          # Lazygit integration - https://github.com/helix-editor/helix/discussions/12045#discussioncomment-11277859
          # Note: using insert-output for lazygit breaks key handling in kitty, whereas this method doesn't, however,
          # it requires a manual reload-all to see updated git gutters as the sh command is not async and reload-all
          # will not run if added to the C-g below.
          C-g = [
            ":sh kitty @ launch --no-response --cwd=current --type=overlay --copy-env lazygit"
          ];
          # Yazi integration - https://github.com/helix-editor/helix/discussions/12934#discussioncomment-12438498
          # Note: this has certain limitations and issues, you can't mass edit files for example.
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
