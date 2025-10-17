{ lib, pkgs, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      pyright # Python LSP
      ruff # Python Formatter & Linter
    ];
    languages = {
      language = [{
        name = "python";
        language-servers = [ "pyright" "ruff" "scls" ];
      }];
      language-server = {
        ruff = {
          command = "ruff";
          args = [ "server" ];
        };
        # Prevent ruff conflict
        pyright.config.python.analysis.typeCheckingMode = "basic";
      };
    };
  };

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "python" ]  
    path = "snippets/python/python.json"
  '';
}
