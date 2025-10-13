{ pkgs, ... }:

let
  icons = import ../../icons.nix;
in
{
  home.packages = with pkgs; [
    rustfmt # Rust format
  ];

  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        rust_analyzer = {
          enable = true; # Rust
          installCargo = true;
          installRustc = true;
        };
        clangd.enable = true; # C, C++
        omnisharp.enable = true; # C#
        nil_ls.enable = true; # Nix
        lua_ls.enable = true; # Lua
        pyright.enable = true; # Python
        ruff.enable = true; # Python (Format & Lint)
        bashls.enable = true; # Bash
        taplo.enable = true; # TOML
        gdscript = {
          enable = true;
          package = null; # Uses Godot
        };
        sqls = {
          enable = true;
          onAttach.function = ''
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          '';
        };
        html = {
          enable = true;
          # Disable formatting (conflicts with Prettier)
          onAttach.function = ''
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          '';
        };
        cssls.enable = true; # CSS
        jsonls.enable = true; # JSON
        eslint.enable = true; # JavaScript Linter
        ts_ls.enable = true; # TypeScript
        svelte.enable = true; # Svelte
        prismals = {
          enable = true;
          package = pkgs.prisma-language-server;
        };
        marksman.enable = true; # Markdown
      };
      keymaps = {
        silent = true;
        lspBuf = {
          "<leader>a" = {
            action = "code_action";
            desc = "Code action";
          };
          "gi" = {
            action = "implementation";
            desc = "Goto implementation";
          };
          "gr" = {
            action = "references";
            desc = "Goto references";
          };
          "<leader>k" = {
            action = "hover";
            desc = "Show docs for item under cursor";
          };
        };
      };
    };
    extraConfigLua = ''
      local lspconfig = require("lspconfig")

      local signs = {
        { name = "DiagnosticSignError", text = "${icons.diagnostics.BoldError}" },
        { name = "DiagnosticSignWarn",  text = "${icons.diagnostics.BoldWarning}" },
        { name = "DiagnosticSignHint",  text = "${icons.diagnostics.BoldHint}" },
        { name = "DiagnosticSignInfo",  text = "${icons.diagnostics.BoldInformation}" },
      }

      for _, sign in pairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end
    '';
  };
}
