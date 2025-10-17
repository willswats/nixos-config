{ pkgs, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      taplo # toml
    ];
    languages = {
      language = [
        {
          name = "toml";
          language-servers = [
            "taplo"
            "scls"
          ];
        }
      ];
    };
  };
}
