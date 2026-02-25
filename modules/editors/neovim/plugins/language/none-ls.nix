{ pkgs, ... }:

{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        prettier = {
          enable = true; # Web
          disableTsServerFormatter = true; # Use the ts_ls language server formatter instead
        };
        nixpkgs_fmt.enable = true; # Nix
        shfmt.enable = true; # Bash
        sql_formatter = {
          enable = true; # SQL
          package = pkgs.sql-formatter;
          settings.extra_args = [
            "-l"
            "postgresql"
            "-c"
            ''
              {
                  "language": "postgresql",
                  "dialect": "postgresql",
                  "tabWidth": 4,
                  "keywordCase": "upper",
                  "dataTypeCase": "upper",
                  "functionCase": "upper"
              }
            ''
          ];
        };
        gdformat.enable = true; # Godot
      };
      diagnostics = {
        markdownlint = {
          enable = true; # Markdown
          settings.extra_args = [
            "--disable"
            "MD013"
          ];
        };
        gdlint.enable = true; # Godot
      };
    };
  };
}
