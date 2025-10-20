{ pkgs, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      prisma-language-server
    ];
    languages = {
      language = [{
        name = "prisma";
        language-servers = [ "scls" "prisma-language-server" ];
        auto-format = true;
      }];
    };
  };
}
