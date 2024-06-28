{ ... }:

{
  imports = [
    ./swaylock
    ./grimshot
  ];

  programs.sway = {
    enable = true;
  };
}
