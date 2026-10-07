{ ... }:

{
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  security.pam.services.swaylock.enableGnomeKeyring = true;
}
