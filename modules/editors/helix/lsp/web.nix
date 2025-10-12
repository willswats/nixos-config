{ lib, pkgs, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint language servers
    typescript-language-server # TypeScript LSP
    nodePackages.prettier # Formatter
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter
    ''
      [[language]]
      name = "html"
      language-servers = [
        "vscode-html-language-server",
        "scls"
      ]

      [[language]]
      name = "css"
      language-servers = [
        "vscode-css-language-server",
        "scls"
      ]
      
      [[language]]
      name = "javascript"
      language-servers = [
        "typescript-language-server",
        "vscode-eslint-language-server",
        "scls"
      ]

      [[language]]
      name = "jsx"
      language-servers = [
        "typescript-language-server",
        "vscode-eslint-language-server",
        "scls"
      ]

      [[language]]
      name = "typescript"
      language-servers = [
        "typescript-language-server",
        "vscode-eslint-language-server",
        "scls"
      ]
    
      [[language]]
      name = "tsx"
      language-servers = [
        "typescript-language-server",
        "vscode-eslint-language-server",
        "scls"
      ]
      
      [[language]]
      name = "json"
      language-servers = [
        "vscode-json-language-server",
        "scls"
      ]

      [[language]]
      name = "html"
      formatter = { command = 'prettier', args = ["--parser", "html"] }

      [[language]]
      name = "css"
      formatter = { command = 'prettier', args = ["--parser", "css"] }

      [[language]]
      name = "javascript"
      formatter = { command = 'prettier', args = ["--parser", "typescript"] }

      [[language]]
      name = "jsx"
      formatter = { command = 'prettier', args = ["--parser", "typescript"] }

      [[language]]
      name = "typescript"
      formatter = { command = 'prettier', args = ["--parser", "typescript"] }

      [[language]]
      name = "tsx"
      formatter = { command = 'prettier', args = ["--parser", "typescript"] }
    '';

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
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
  '';

}
