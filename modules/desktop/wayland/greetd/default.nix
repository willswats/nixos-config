{ ... }:

{
  services.greetd = {
    enable = true;
    vt = 1;
  };

  # unlock GPG keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;
}
