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
    defaultCacheTtl = 604800; # 1 week
    maxCacheTtl = 604800; # 1 week
    defaultCacheTtlSsh = 604800; # 1 week
    maxCacheTtlSsh = 604800; # 1 week
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
