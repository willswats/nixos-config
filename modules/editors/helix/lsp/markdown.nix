{ lib, pkgs, ... }:

{

  programs.helix.extraPackages = with pkgs; [
    marksman # MD Language server
    harper # Spell checker
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [language-server.harper-ls]
    command = "harper-ls"
    args = ["--stdio"]

    [language-server.harper-ls.config.harper-ls]   
    dialect = "British"
    
    [[language]]
    name = "markdown"
    formatter = { command = 'prettier', args = ["--parser", "markdown"] }
    language-servers = [ "marksman", "harper-ls" ]
    auto-format = true
    soft-wrap.enable = true
  '';
}
