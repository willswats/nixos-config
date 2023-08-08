{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt # Nix formatter
    nodePackages.prettier # Code formatter for many languages
    nodePackages.markdownlint-cli # Markdown linter
  ];

  programs.nixvim = {
    # Not defined using the module as `diagnostics.markdownlint` does not exist in it
    # https://github.com/nix-community/nixvim/issues/97
    extraPlugins = with pkgs.vimPlugins; [ null-ls-nvim ];
    extraConfigLua = ''
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        debug = false,
        sources = {
          formatting.prettier,
          formatting.nixpkgs_fmt,
          diagnostics.markdownlint.with({ extra_args = { "--disable", "MD013" } })
        },
      })
    '';
  };
}
