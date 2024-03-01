{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    nodePackages.prettier # Code formatter for many languages
    nixpkgs-fmt # Nix formatter
    taplo # TOML formatter
    shfmt # shell formatter
    sqlfluff # SQL formatter and linter
    nodePackages.markdownlint-cli # Markdown linter
  ];

  programs.nixvim.plugins.none-ls = {
    enable = true;
    # Servers are defined in `extraOptions.sources`, because `diagnostics.markdownlint` does not exist in the null-ls module
    # https://github.com/nix-community/nixvim/issues/97
    extraOptions.sources =
      let
        null-ls = "require('null-ls')";
        formatting = "${null-ls}.builtins.formatting";
        diagnostics = "${null-ls}.builtins.diagnostics";
      in
      (config.nixvim.helpers.mkRaw ''
        { 
          ${formatting}.prettier,
          ${formatting}.nixpkgs_fmt,
          ${formatting}.taplo,
          ${formatting}.shfmt,
          ${formatting}.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
          ${diagnostics}.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
          ${diagnostics}.markdownlint.with({ extra_args = { "--disable", "MD013" } })
        }
      '');
  };
}
