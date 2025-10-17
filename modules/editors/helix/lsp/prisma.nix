{ pkgs, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      prisma-language-server
    ];
    languages = {
      language = [{
        name = "prisma";
        language-servers = [ "prisma-language-server" "scls" ];
      }];
    };
  };
}
