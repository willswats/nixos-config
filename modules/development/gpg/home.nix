{ ... }:

{
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableSshSupport = true;
    defaultCacheTtl = 86400; # 86400 seconds - 24 hours
    maxCacheTtl = 86400; # 86400 seconds - 24 hours
    defaultCacheTtlSsh = 86400; # 86400 seconds - 24 hours
    maxCacheTtlSsh = 86400; # 86400 seconds - 24 hours
    pinentryFlavor = "qt";
  };
}
