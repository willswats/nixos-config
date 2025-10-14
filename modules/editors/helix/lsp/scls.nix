{ pkgs, lib, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    (callPackage ../../../../pkgs/simple-completion-language-server { })
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [language-server.scls]
    command = "simple-completion-language-server"
    
    [language-server.scls.config]
    feature_words = true                 # enable completion by word
    feature_snippets = true              # enable snippets
    snippets_first = true                # completions will return before snippets by default
    snippets_inline_by_word_tail = false # suggest snippets by WORD tail, for example text `xsq|` become `x^2|` when snippet `sq` has body `^2`
    feature_unicode_input = false        # enable "unicode input"
    feature_paths = true                 # enable path completion
    feature_citations = false            # enable citation completion (only on `citation` feature enabled)    
  '';

  # Snippets: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets
  # Use language identifier for scope field:
  # https://code.visualstudio.com/docs/languages/identifiers#_known-language-identifiers
  xdg.configFile."helix/external-snippets.toml".text = ''
    [[sources]] 
    name = "friendly-snippets"  
    git = "https://github.com/rafamadriz/friendly-snippets.git" 
  '';

  systemd.user.services.scls =
    let
      scls = "${pkgs.simple-completion-language-server}/bin/simple-completion-language-server";
      fetch-external-snippets = pkgs.writeShellScript "fetchExternalSnippets.sh" ''
        SNIPPETS_DIR="$HOME/.config/helix/external-snippets/"

        if [ ! -d "$SNIPPETS_DIR" ]; then
            ${scls} fetch-external-snippets
        fi
      '';
    in
    {
      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        Type = "oneshot";
        ExecStart = fetch-external-snippets.outPath;
        Environment = "PATH=${pkgs.git}/bin:${pkgs.coreutils}/bin:$PATH";
      };

      Unit = {
        Description = "simple-completion-language-server - fetch external snippets";
      };
    };
}
