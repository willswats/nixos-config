{ lib, pkgs, ... }:

{

  programs.helix.extraPackages = with pkgs; [
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint language servers
    typescript-language-server # TypeScript LSP
    svelte-language-server # Svelte LSP
    nodePackages.prettier # Formatter
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [[language]]
    name = "javascript"
    language-servers = [
      "typescript-language-server",
      "vscode-eslint-language-server",
    ]

    [[language]]
    name = "typescript"
    language-servers = [
      "typescript-language-server",
      "vscode-eslint-language-server",
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
    name = "typescript"
    formatter = { command = 'prettier', args = ["--parser", "typescript"] }

    [[language]]
    name = "tsx"
    formatter = { command = 'prettier', args = ["--parser", "typescript"] }
  '';
}
