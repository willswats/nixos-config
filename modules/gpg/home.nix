{ pkgs, ... }:

{
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableFishIntegration = true;
    enableSshSupport = true;
    defaultCacheTtl = 86400; # 86400 seconds - 24 hours
    defaultCacheTtlSsh = 86400; # 86400 seconds - 24 hours
    pinentryFlavor = "gtk2";
  };
}
