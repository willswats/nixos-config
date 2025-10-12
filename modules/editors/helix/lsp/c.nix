{ pkgs, lib, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    clangd
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [[language]]
    name = "c"
    language-servers = [ "clangd", "scls" ]

    [[language]]
    name = "cpp"
    language-servers = [ "clangd", "scls" ]
  '';

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "c" ]  
    path = "snippets/c/c.json"    

    [[sources.paths]] 
    scope = [ "cpp" ]  
    path = "snippets/cpp/cpp.json"    
  '';
}
