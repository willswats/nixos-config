{ lib, pkgs, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint language servers
    typescript-language-server # TypeScript LSP
    svelte-language-server # Svelte LSP
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
      name = "html"
      formatter = { command = 'prettier', args = ["--parser", "html"] }
      auto-format = true

      [[language]]
      name = "css"
      formatter = { command = 'prettier', args = ["--parser", "css"] }
      auto-format = true

      [[language]]
      name = "javascript"
      formatter = { command = 'prettier', args = ["--parser", "typescript"] }
      auto-format = true

      [[language]]
      name = "jsx"
      formatter = { command = 'prettier', args = ["--parser", "typescript"] }
      auto-format = true

      [[language]]
      name = "typescript"
      formatter = { command = 'prettier', args = ["--parser", "typescript"] }
      auto-format = true

      [[language]]
      name = "tsx"
      formatter = { command = 'prettier', args = ["--parser", "typescript"] }
      auto-format = true
    '';
}
