{ ... }:

{
  imports = [
    ../lsp/home.nix
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
        inline-diagnostics.cursor-line = "hint"; # cursor-line diagnostics
      };
      keys = {
        insert = {
          j.k = "normal_mode";
          k.j = "normal_mode";
        };
      };
    };
  };
}
