{ pkgs, ... }:

{

  home.packages = with pkgs; [
    # Nix
    nil
    nixpkgs-fmt
    # Web
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint language servers
    typescript-language-server
    svelte-language-server
    nodePackages.prettier
    nodePackages.eslint
    # Markdown
    marksman
    markdownlint-cli
    # Lua
    lua-language-server
    # Python
    pyright
    ruff-lsp
    # C#
    csharp-ls
    # C, C++
    clang-tools
    # Rust
    rust-analyzer
    rustfmt
    # SQL
    sqls
    # Haskell
    haskell-language-server
    # Bash
    bash-language-server
    # TOML
    taplo
  ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        bufferline = "multiple";
        cursor-shape.insert = "bar";
        indent-guides.render = true;
      };
      keys = {
        normal = {
          space.w = ":w";
          space.q = ":q";
        };
        insert = {
          j.k = "normal_mode";
          k.j = "normal_mode";
        };
      };
    };
  };
}
