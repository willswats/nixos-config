{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt # Nix formatter
    nodePackages.prettier # Code formatter for many languages
    nodePackages.markdownlint-cli # Markdown linter
  ];

  programs.nixvim.plugins.null-ls = {
    enable = true;
    sources = {
      formatting = {
        prettier.enable = true;
        nixfmt.enable = true;
      };
    };
  };
}
