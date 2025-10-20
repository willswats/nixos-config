{ pkgs, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      rust-analyzer # Rust LSP
    ];
    languages = {
      language = [
        {
          name = "rust";
          language-servers = [
            "scls"
            "rust-analyzer"
          ];
          auto-format = true;
        }
      ];
      language-server = {
        rust-analyzer.config.check.command = "clippy";
      };
    };
  };

  xdg.configFile."helix/external-snippets.toml".text = ''
    [[sources.paths]] 
    scope = [ "rust" ]  
    path = "snippets/rust/rust.json"
  '';
}
