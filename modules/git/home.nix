{ ... }:

{
  programs.git = {
    enable = true;
    userName = "willswats";
    userEmail = "williamstuwatson@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };
}
