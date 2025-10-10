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
        cursor-shape.insert = "bar";
        indent-guides.render = true;
      };
      keys = {
        normal = {
          space.w = ":w";
          space.q = ":q";
        };
        insert = {
          j.k = "normal_mode";
          k.j = "normal_mode";
        };
      };
    };
  };
}
