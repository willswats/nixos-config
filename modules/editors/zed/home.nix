{ ... }:

{
  imports = [
    ../lsp/home.nix
  ];

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
      "nix"
      "sql"
      "ruff"
      "marksman"
      "markdownlint"
      "gdscript"
      "lua"
      "svelte"
    ];
  };
}
