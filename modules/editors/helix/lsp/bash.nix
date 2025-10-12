{ pkgs, lib, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    bash-language-server
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [[language]]
    name = "bash"
    language-servers = [ "bash-language-server", "scls" ]
  '';

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "shellscript" ]  
    path = "snippets/shell/shell.json"    
  '';
}
