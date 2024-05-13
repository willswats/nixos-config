{ ... }:

{
  # Note that PAM must be configured to enable hyprlock to perform authentication. 
  # The package installed through home-manager will not be able to unlock the session without this configuration.
  security.pam.services.hyprlock = { };
}
