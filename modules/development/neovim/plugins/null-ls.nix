{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt # Nix formatter
    nodePackages.prettier # Code formatter for many languages
    nodePackages.markdownlint-cli # Markdown linter
  ];

  programs.nixvim.plugins.null-ls = {
    enable = true;
    # Servers are defined in `extraOptions.sources`, because `diagnostics.markdownlint` does not exist in the null-ls module
    # https://github.com/nix-community/nixvim/issues/97
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
