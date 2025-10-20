{ lib, pkgs, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      nil # Nix LSP
      nixpkgs-fmt # Nix Formatter
    ];
    languages = {
      language = [
        {
          name = "nix";
          language-servers = [
            "scls"
            "nil"
          ];
          auto-format = true;
          formatter = {
            command = "nixpkgs-fmt";
          };
        }
      ];
    };
  };

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "nix" ]  
    path = "snippets/nix.json"    
  '';
}
