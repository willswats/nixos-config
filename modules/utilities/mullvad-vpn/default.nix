{ ... }:

{
  networking.wireguard.enable = true;
  services.mullvad-vpn.enable = true;
  # This fixes no internet connection when connected to Mullvad VPN
  # # https://discourse.nixos.org/t/connected-to-mullvadvpn-but-no-internet-connection/35803/6
  services.resolved.enable = true;
}
