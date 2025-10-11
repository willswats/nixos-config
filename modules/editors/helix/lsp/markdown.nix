{ lib, pkgs, ... }:

{

  programs.helix.extraPackages = with pkgs; [
    marksman # MD Language server
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [[language]]
    name = "markdown"
    soft-wrap.enable = true
    formatter = { command = 'prettier', args = ["--parser", "markdown"] }
  '';
}
