{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fd # Telescope dependency
    ripgrep # Telescope dependency
    gcc # rustup dependency
    rustup # Provides rust LSP
    nil # Nix LSP
    nixpkgs-fmt # Nix formatter
    lua-language-server # Lua language server and formatter
    nodePackages.typescript-language-server # TypeScript LSP
    nodePackages.prettier # Code formatter for many languages
    nodePackages.markdownlint-cli # Markdown linter
    nodePackages.eslint # JS, TS Linter
    marksman # Markdown lsp
    trash-cli # Required for nvim-tree trash
  ];

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    extraPython3Packages = pyPkgs: with pyPkgs;[
      pynvim
    ];
  };

  xdg.configFile.nvim.source = ./nvim;
}
