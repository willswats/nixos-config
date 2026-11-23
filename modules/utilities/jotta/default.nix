{ pkgs, ... }:

{
  services.jotta-cli = {
    enable = true;

  };

  environment.systemPackages = with pkgs; [ jotta-cli ];
}
