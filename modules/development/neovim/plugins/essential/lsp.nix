{ pkgs, ... }:

let
  icons = import ../../icons.nix;
  capabilities = "require('cmp_nvim_lsp').default_capabilities()";
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
        csharp_ls.enable = true; # C#
        nil_ls.enable = true; # Nix
        lua_ls.enable = true; # Lua
        pyright.enable = true; # Python
        ruff.enable = true; # Python (Format & Lint)
        dartls.enable = true; # Dart
        bashls.enable = true; # Bash
        taplo.enable = true; # TOML
        gdscript = {
          enable = true;
          package = null;
        };
        hls = {
          # Haskell
          enable = true;
          installGhc = true;
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
        marksman.enable = true; # Markdown
        cssls.enable = true; # CSS
        jsonls.enable = true; # JSON
        ts_ls.enable = true; # TypeScript
        eslint.enable = true; # JavaScript Linter
        svelte.enable = true; # Svelte
        prismals = {
          enable = true;
          package = pkgs.prisma-language-server;
        };
      };
      capabilities = capabilities;
      keymaps = {
        silent = true;
        diagnostic = {
          "<leader>lj" = {
            action = "goto_next";
            desc = "Next diagnostic";
          };
          "<leader>lk" = {
            action = "goto_prev";
            desc = "Previous diagnostic";
          };
          "<leader>lf" = {
            action = "open_float";
            desc = "Float";
          };
        };
        lspBuf = {
          "<leader>la" = {
            action = "code_action";
            desc = "Action";
          };
          "<leader>li" = {
            action = "implementation";
            desc = "Implementation";
          };
          "<leader>lr" = {
            action = "references";
            desc = "References";
          };
          "<leader>lh" = {
            action = "hover";
            desc = "Hover";
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
