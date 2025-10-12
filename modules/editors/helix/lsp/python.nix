{ lib, pkgs, ... }:

{

  programs.helix.extraPackages = with pkgs; [
    pyright # Python LSP
    ruff # Python Formatter & Linter
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [[language]]
    name = "python"
    language-servers = [ "pyright", "ruff", "scls" ]

    # Prevent ruff conflict
    [language-server.pyright.config.python.analysis]
    typeCheckingMode = "basic"

    [language-server.ruff]
    command = "ruff"
    args = ["server"]
  '';


  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "python" ]  
    path = "snippets/python/python.json"
  '';
}
