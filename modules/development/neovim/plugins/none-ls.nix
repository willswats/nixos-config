{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    nodePackages.prettier # Code formatter for many languages
    nixpkgs-fmt # Nix formatter
    sqlfluff # SQL formatter and linter
    python311Packages.black # Python formatting
    python311Packages.flake8 # Python diagnostics
    nodePackages.markdownlint-cli # Markdown linter
  ];

  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources.formatting.sqlfluff.enable = true;
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
          ${formatting}.sqlfluff,
          ${diagnostics}.sqlfluff,
          ${diagnostics}.flake8,
          ${formatting}.black.with({ extra_args = { "--preview", "-l", "80" } }),
          ${diagnostics}.markdownlint.with({ extra_args = { "--disable", "MD013" } })
        }
      '');
  };
}
