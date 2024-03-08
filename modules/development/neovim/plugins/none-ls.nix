{ ... }:

{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        prettier = {
          enable = true; # Web
          disableTsServerFormatter = true;
        };
        nixpkgs_fmt.enable = true; # Nix
        shfmt.enable = true; # Bash
        sqlfluff = {
          enable = true; # SQL
          withArgs = ''{ extra_args = { "--dialect", "postgres" } }'';
        };
      };
      diagnostics = {
        sqlfluff = {
          enable = true; # SQL
          withArgs = ''{ extra_args = { "--dialect", "postgres" } }'';
        };
        markdownlint = {
          enable = true; # Markdown
          withArgs = ''{ extra_args = { "--disable", "MD013" } }'';
        };
      };
    };
  };
}
