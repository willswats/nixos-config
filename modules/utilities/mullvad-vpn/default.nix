{ ... }:

{
  networking.wireguard.enable = true;
  services.mullvad-vpn.enable = true;
  # Fixes: https://discourse.nixos.org/t/connected-to-mullvadvpn-but-no-internet-connection/35803/12
  # You can potentially remove this in the latest version: https://github.com/mullvad/mullvadvpn-app/issues/5499
  networking.resolvconf.enable = false;
}
