{ ... }:

{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources =
      let
        # Must be specified here as the formatter does not seem to read the settings from
        # the .sqlfluff file for some reason
        sqlfluffSettings = ''
          { 
              extra_args = { 
                  "--dialect", "postgres", 
                  "--exclude-rules", "ST07, LT02" 
              } 
          }
        '';
      in
      {
        formatting = {
          prettier = {
            enable = true; # Web
            disableTsServerFormatter = true;
          };
          nixpkgs_fmt.enable = true; # Nix
          shfmt.enable = true; # Bash
          sqlfluff = {
            enable = true; # SQL
            settings = sqlfluffSettings;
          };
        };
        diagnostics = {
          sqlfluff = {
            enable = true; # SQL
            settings = sqlfluffSettings;
          };
          markdownlint = {
            enable = true; # Markdown
            settings = ''{ extra_args = { "--disable", "MD013" } }'';
          };
        };
      };
  };
}
