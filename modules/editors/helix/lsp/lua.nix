{ pkgs, lib, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      lua-language-server
    ];
    languages = {
      language = [
        {
          name = "lua";
          language-servers = [
            "scls"
            "lua-language-server"
          ];
          auto-format = true;
        }
      ];
    };
  };

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "lua" ]  
    path = "snippets/lua/lua.json"    
  '';
}
