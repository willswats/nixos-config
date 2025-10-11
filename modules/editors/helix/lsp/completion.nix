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

  # Snippets: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets
  # Use language identifier for scope field:
  # https://code.visualstudio.com/docs/languages/identifiers#_known-language-identifiers
  xdg.configFile."helix/external-snippets.toml".text = ''
    [[sources]] 
    name = "friendly-snippets"  
    git = "https://github.com/rafamadriz/friendly-snippets.git" 
    
    [[sources.paths]] 
    scope = [ "html" ]  
    path = "snippets/html.json"
    
    [[sources.paths]] 
    scope = [ "css" ]  
    path = "snippets/css.json"

    [[sources.paths]] 
    scope = [ "javascript" ]  
    path = "snippets/javascript/javascript.json"

    [[sources.paths]] 
    scope = [ "javascriptreact" ]  
    path = "snippets/javascript/react.json"    

    [[sources.paths]] 
    scope = [ "javascriptreact" ]  
    path = "snippets/javascript/next.json"    

    [[sources.paths]] 
    scope = [ "typescript" ]  
    path = "snippets/javascript/typescript.json"

    [[sources.paths]] 
    scope = [ "typescriptreact" ]  
    path = "snippets/javascript/react-ts.json"    
    
    [[sources.paths]] 
    scope = [ "typescriptreact" ]  
    path = "snippets/javascript/next-ts.json"    

    [[sources.paths]] 
    scope = [ "markdown" ]  
    path = "snippets/markdown.json"    

    [[sources.paths]] 
    scope = [ "nix" ]  
    path = "snippets/nix.json"    

    [[sources.paths]] 
    scope = [ "python" ]  
    path = "snippets/python/python.json"

    [[sources.paths]] 
    scope = [ "rust" ]  
    path = "snippets/rust/rust.json"

    [[sources.paths]] 
    scope = [ "gdscript" ]
    path = "snippets/gdscript.json"
  '';
}
