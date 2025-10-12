{ pkgs, lib, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    omnisharp-roslyn
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [[language]]
    name = "c-sharp"
    language-servers = [ "omnisharp", "scls" ]
  '';

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "csharp" ]  
    path = "snippets/csharp/csharp.json"    
  '';
}
