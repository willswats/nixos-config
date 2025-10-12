{ pkgs, lib, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    prisma-language-server
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [[language]]
    name = "prisma"
    language-servers = [ "prisma-language-server", "scls" ]
  '';
}
