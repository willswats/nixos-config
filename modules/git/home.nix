{ ... }:

{
  programs.git = {
    enable = true;
    userName = "willswats";
    userEmail = "willswats@users.noreply.github.com";
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = "~/.config/git/allowed_signers";
      };
    };
  };
}
