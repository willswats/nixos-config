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
    language-servers = [ "rust-analyzer", "scls" ]
    formatter = { command = "taplo", args = ["format", "-"] }
    auto-format = true
  '';


  xdg.configFile."helix/external-snippets.toml".text = ''
    [[sources.paths]] 
    scope = [ "rust" ]  
    path = "snippets/rust/rust.json"
  '';
}
