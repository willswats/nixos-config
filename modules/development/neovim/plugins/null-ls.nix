{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt # Nix formatter
    nodePackages.prettier # Code formatter for many languages
    nodePackages.markdownlint-cli # Markdown linter
  ];

  programs.nixvim.plugins.null-ls = {
    enable = true;
    extraOptions.sources = let
      null-ls = "require('null-ls')";
      formatting = "${null-ls}.builtins.formatting";
      diagnostics = "${null-ls}.builtins.diagnostics";
    in (config.nixvim.helpers.mkRaw ''
      { 
        ${formatting}.prettier,
        ${formatting}.nixfmt,
        ${diagnostics}.markdownlint.with({ extra_args = { "--disable", "MD013" } })
      }
    '');
  };
}
