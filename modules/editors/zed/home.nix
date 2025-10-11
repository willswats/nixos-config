{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    # themes =
    userSettings = {
      telemetry = {
        metrics = false;
      };
      vim_mode = true;
      ui_font_size = 18;
      buffer_font_size = 18;
      theme = {
        mode = "dark";
        dark = "Catppuccin Mocha";
      };
      icon_theme = "Catppuccin Mocha";
    };
    extensions = [
      # https://github.com/zed-industries/extensions/tree/main/extensions
      # Theme
      "catppuccin"
      "catppuccin-icons"
      # LSP
      ## Nix
      "nix"
      ## SQL
      "sql"
      ## Web
      "svelte"
      ## Markdown
      "marksman"
      "markdownlint"
      ## Python
      "ruff"
      ## Godot
      "gdscript"
      ## Lua
      "lua"
      ## Rust
      "toml"
    ];
  };

  # LSP, Formatters & Linters
  home.packages = with pkgs; [
    # Nix
    nil # Nix LSP
    nixpkgs-fmt # Nix Formatter

    # Web
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint language servers
    typescript-language-server # TypeScript LSP
    svelte-language-server # Svelte LSP
    nodePackages.prettier # Formatter

    # Markdown
    marksman # MD Language server
    markdownlint-cli # MD Linter

    # Lua
    lua-language-server # Lua Language server

    # Python
    pyright # Python LSP
    ruff # Python Formatter & Linter

    # C#
    omnisharp-roslyn # C# LSP

    # C, C++
    clang-tools # C, C++ LSP

    # Rust
    rust-analyzer # Rust LSP

    # TOML
    taplo # TOML LSP

    # SQL
    sqls # SQL LSP

    # Bash
    bash-language-server # Bash LSP
  ];
}
