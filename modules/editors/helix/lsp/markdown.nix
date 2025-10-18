{ lib, pkgs, ... }:

{

  programs.helix = {
    languages = {
      language = [
        {
          name = "markdown";
          language-servers = [
            "marksman"
            "harper-ls"
            "scls"
            {
              name = "efm";
              only-features = [ "diagnostics" ];
            }
            "mpls"
          ];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "markdown"
            ];
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
        efm = {
          command = "efm-langserver";
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
      harper # Spell checker
      efm-langserver # Wrapper lsp for markdownlint-cli
      markdownlint-cli # Markdown linter
      mpls # Markdown preview lsp
    ];
  };

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "markdown" ]  
    path = "snippets/markdown.json"    
  '';

  # Configure efm-langserver to use markdownlint-cli
  # https://github.com/helix-editor/helix/discussions/11639#discussioncomment-10572676
  xdg.configFile."efm-langserver/config.yaml".text = ''
    version: 2
    #log-file: "/Users/some-user/.config/efm-langserver/log.log"
    #log-level: 2

    languages:
     markdown:
       - lint-command: "markdownlint --disable MD013 -s"
         lint-stdin: true
         lint-after-open: true
         lint-on-save: true
         lint-formats:
           - "%f:%l %m"
           - "%f:%l:%c %m"
           - "%f: %l: %m"
  '';
}
