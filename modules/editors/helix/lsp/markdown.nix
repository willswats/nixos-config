{ lib, pkgs, ... }:

{

  programs.helix = {
    languages = {
      language = [
        {
          name = "markdown";
          language-servers = [
            "scls"
            "marksman"
            "rumdl"
            "harper-ls"
            "mpls"
          ];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [ "--parser" "markdown" "--prose-wrap" "always" ];
          };
          soft-wrap.enable = true;
          comment-tokens = [
            "-"
            "+"
            "*"
            "- [ ]"
            ">"
          ];
        }
      ];
      language-server = {
        rumdl = {
          command = "rumdl";
          args = [ "server" "-v" ];
        };
        harper-ls = {
          command = "harper-ls";
          args = [
            "--stdio"
          ];
          config.harper-ls = {
            dialect = "British";
            linters = {
              LongSentences = false;
            };
          };
        };
        mpls = {
          command = "mpls";
          args = [
            "--no-auto"
            "--dark-mode"
            "--enable-emoji"
          ];
        };
      };
    };
    extraPackages = with pkgs; [
      marksman # MD Language server
      prettier # Markdown formatter
      rumdl # Markdown linter
      harper # Spell checker
      mpls # Markdown preview lsp
    ];
  };

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "markdown" ]  
    path = "snippets/markdown.json"    
  '';
}
