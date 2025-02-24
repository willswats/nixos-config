{ ... }:

let
  email = "william@williamwatson.dev";
in
{
  programs.git = {
    enable = true;
    userName = "willswats";
    userEmail = email;
    signing = {
      key = email;
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      pull.ff = "only";
    };
  };
}
