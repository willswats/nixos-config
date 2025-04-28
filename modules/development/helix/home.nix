{ pkgs, ... }:

{

  home.packages = with pkgs; [
    # Nix
    nil # Nix LSP
    nixpkgs-fmt # Nix Formatter
    # Web
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint language servers
    typescript-language-server # TypeScript LSP
    svelte-language-server # Svelte LSP
    nodePackages.prettier # Formatter
    nodePackages.eslint # Linter
    # Markdown
    marksman # MD Language server
    markdownlint-cli # MD Linter
    # Lua
    lua-language-server # Lua Language server
    # Python
    pyright # Python LSP
    ruff # Python Formatter & Linter
    # C#
    csharp-ls # C# LSP
    # C, C++
    clang-tools # C, C++ LSP
    # Rust
    rust-analyzer # Rust LSP
    rustfmt # Rust Formatter
    # SQL
    sqls # SQL LSP
    # Haskell
    haskell-language-server # Haskell LSP
    # Bash
    bash-language-server # Bash LSP
    # TOML
    taplo # TOML LSP
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
