{ ... }:

{
  boot.initrd.systemd.enable = true;
  boot.plymouth = {
    enable = true;
    catppuccin.enable = true;
  };
}
