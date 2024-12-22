{ ... }:

{
  boot.initrd.systemd.enable = true;
  boot.plymouth = {
    enable = true;
  };
  catppuccin.plymouth.enable = true;
}
