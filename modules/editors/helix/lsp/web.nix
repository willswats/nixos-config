{ lib, pkgs, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      vscode-langservers-extracted # HTML/CSS/JSON/ESLint language servers
      typescript-language-server # TypeScript LSP
      nodePackages.prettier # Formatter
    ];
    languages = {
      language = [
        {
          name = "html";
          language-servers = [
            "scls"
            "vscode-html-language-server"
          ];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "html"
            ];
          };
        }
        {
          name = "css";
          language-servers = [
            "scls"
            "vscode-css-language-server"
          ];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "css"
            ];
          };
        }
        {
          name = "javascript";
          language-servers = [
            "scls"
            "typescript-language-server"
            "vscode-eslint-language-server"
          ];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "typescript"
            ];
          };
        }
        {

          name = "jsx";
          language-servers = [
            "scls"
            "typescript-language-server"
            "vscode-eslint-language-server"
          ];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "typescript"
            ];
          };
        }
        {
          name = "typescript";
          language-servers = [
            "scls"
            "typescript-language-server"
            "vscode-eslint-language-server"
          ];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "typescript"
            ];
          };
        }
        {
          name = "tsx";
          language-servers = [
            "scls"
            "typescript-language-server"
            "vscode-eslint-language-server"
          ];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "typescript"
            ];
          };
        }
        {
          name = "json";
          language-servers = [
            "scls"
            "vscode-json-language-server"
          ];
          auto-format = true;
        }
      ];
    };
  };

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
