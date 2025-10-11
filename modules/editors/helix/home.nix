{ ... }:

{
  imports = [
    ./lsp/nix.nix
    ./lsp/web.nix
    ./lsp/markdown.nix
    ./lsp/python.nix
    ./lsp/rust.nix
    ./lsp/godot.nix
  ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        bufferline = "multiple";
        cursorline = true;
        cursor-shape.insert = "bar";
        indent-guides.render = true;
      };
      editor = {
        lsp = {
          display-inlay-hints = true; # type hints
        };
      };
      keys = {
        insert = {
          j.k = "normal_mode";
          k.j = "normal_mode";
        };
        normal = {
          # Lazygit integration - https://helix-editor.vercel.app/help/recipes#git-integration
          C-g = [
            ":write-all"
            ":new"
            ":insert-output lazygit"
            ":buffer-close!"
            ":redraw"
            ":reload-all"
          ];
        };
      };
    };
  };

  # https://helix-editor.vercel.app/reference/language-servers
  xdg.configFile."helix/languages.toml".text = '''';
}
