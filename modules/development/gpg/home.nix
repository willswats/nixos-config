{ pkgs, ... }:

{
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableSshSupport = true;
    defaultCacheTtl = 34560000; # 400 days
    maxCacheTtl = 34560000; # 400 days
    defaultCacheTtlSsh = 34560000; # 400 days
    maxCacheTtlSsh = 34560000; # 400 days
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
