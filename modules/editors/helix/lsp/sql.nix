{ pkgs, lib, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      postgres-language-server
      sql-formatter
    ];
    languages = {
      language = [{
        name = "sql";
        language-servers = [ "scls" "postgrestools" ];
        auto-format = true;
        formatter = {
          command = "sql-formatter";
          args = [
            "-l"
            "postgresql"
            "-c"
            ''{ "language": "postgresql",  "dialect": "postgresql",  "tabWidth": 4,  "keywordCase": "upper",  "dataTypeCase": "upper",  "functionCase": "upper" }''
          ];
        };
      }];
      language-server = {
        postgrestools = {
          command = "postgrestools";
          args = [ "lsp-proxy" ];
        };
      };
    };
  };

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter
    ''
      [[sources.paths]] 
      scope = [ "sql" ]  
      path = "snippets/sql.json"    
    '';
}
