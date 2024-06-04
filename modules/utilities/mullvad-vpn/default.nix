{ pkgs, ... }:

{
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  networking.wireguard.enable = true;
  # This fixes no internet connection when connected to Mullvad VPN
  # https://discourse.nixos.org/t/connected-to-mullvadvpn-but-no-internet-connection/35803/6
  services.resolved.enable = true;
}
