{ lib, pkgs, ... }:

{

  programs.helix.extraPackages = with pkgs; [
    rust-analyzer # Rust LSP
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [language-server.rust-analyzer.config.check]
    command = "clippy"

    [[language]]
    name = "toml"
    formatter = { command = "taplo", args = ["format", "-"] }
  '';
}
