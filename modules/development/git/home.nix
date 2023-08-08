{ ... }:

let email = "willswats@users.noreply.github.com";
in {
  programs.git = {
    enable = true;
    userName = "willswats";
    userEmail = email;
    # Deleting a GPG key in GitHub that is no longer used causes all of the commits signed by the key to become "Unverified", therefore, 
    # only uncomment this when you have a good way of transferring a GPG key between computers.
    # signing = {
    #   key = email;
    #   signByDefault = true;
    # };
    extraConfig = { init.defaultBranch = "main"; };
  };
}
