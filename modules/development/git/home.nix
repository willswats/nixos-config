{ ... }:

let email = "willswats@users.noreply.github.com";
in {
  programs.git = {
    enable = true;
    userName = "willswats";
    userEmail = email;
    signing = {
      key = email;
      signByDefault = true;
    };
    extraConfig = { init.defaultBranch = "main"; };
  };
}
