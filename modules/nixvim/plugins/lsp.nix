{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc # rustup dependency
    rustup # Provides rust-analyzer
    nil # Nix LSP
    lua-language-server # Lua language server and formatter
    marksman # Markdown lsp
    nodePackages.typescript-language-server # TypeScript LSP
    nodePackages.eslint # JS, TS Linter
  ];

  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      rust-analyzer.enable = true;
      nil_ls.enable = true;
      lua-ls.enable = true;
      tsserver.enable = true;
      eslint.enable = true;
    };
  };
}