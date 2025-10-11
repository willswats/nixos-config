{ pkgs, lib, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    simple-completion-language-server
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
    feature_paths = false                # enable path completion
    feature_citations = false            # enable citation completion (only on `citation` feature enabled)    
  '';
}
