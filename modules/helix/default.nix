{ pkgs, ... }:

{

  home.packages = with pkgs; [
    nil # nix lsp
    nixpkgs-fmt # nix formatter
    lua-language-server # lua lsp
    nodePackages.typescript-language-server # typescript lsp
    nodePackages.prettier # html, css, js, typescript formatter
    nodePackages.eslint # javascript and typescript linter
    marksman # markdown lsp
    nodePackages.markdownlint-cli # markdown linter
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
