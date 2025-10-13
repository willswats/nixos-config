{ pkgs, lib, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    sqls
    sql-formatter
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [language-server.sqls]
    command = "sqls"

    [[language]]
    name = "sql"
    language-servers = [ "sqls", "scls" ]
    formatter = { command = "sql-formatter", args = [ "-l", "postgresql", "-c", '{ "language": "postgresql", "dialect": "postgresql", "tabWidth": 4, "keywordCase": "upper", "dataTypeCase": "upper", "functionCase": "upper" }']}
  '';

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "sql" ]  
    path = "snippets/sql.json"    
  '';
}
