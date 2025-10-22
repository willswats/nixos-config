{ pkgs, ... }:

let
  email = "william@williamwatson.dev";
in
{
  home.packages = with pkgs; [
    gh
    codeberg-cli
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "willswats";
        email = email;
      };
      init.defaultBranch = "main";
      pull.ff = "only";
    };
    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
  };
}
