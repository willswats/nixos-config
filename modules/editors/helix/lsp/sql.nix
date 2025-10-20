{ pkgs, lib, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      sqls
      sql-formatter
    ];
    languages = {
      language = [{
        name = "sql";
        language-servers = [ "scls" "sqls" ];
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
        sqls = {
          command = "sqls";
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
