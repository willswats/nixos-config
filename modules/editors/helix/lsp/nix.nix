{ lib, pkgs, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    nil # Nix LSP
    nixpkgs-fmt # Nix Formatter
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [[language]]
    name = "nix"
    language-servers = [ "nil", "scls" ]
    formatter = { command = "nixpkgs-fmt" }      
    auto-format = true
  '';

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "nix" ]  
    path = "snippets/nix.json"    
  '';
}
