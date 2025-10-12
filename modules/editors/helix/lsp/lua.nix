{ pkgs, lib, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    lua-language-server
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [[language]]
    name = "lua"
    language-servers = [ "lua-language-server", "scls" ]
  '';

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "lua" ]  
    path = "snippets/lua/lua.json"    
  '';
}
