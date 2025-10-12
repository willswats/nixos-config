{ pkgs, lib, ... }:

{

  programs.helix.extraPackages = with pkgs; [
    taplo
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [[language]]
    name = "toml"
    language-servers = [ "taplo", "scls" ]
  '';
}
