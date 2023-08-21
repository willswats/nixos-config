{ ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      color = "1e1e2e";
      font-size = 32;
      indicator-radius = 100;
      daemonize = true; # Fix screen locking multiple times - https://github.com/swaywm/swaylock/issues/86
    };
  };
}
