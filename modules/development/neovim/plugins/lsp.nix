{ pkgs, ... }:

let
  icons = import ../icons.nix;
  capabilities = "require('cmp_nvim_lsp').default_capabilities()";
in
{
  home.packages = with pkgs; [
    marksman # Markdown LSP
    sqls # SQL LSP
  ];

  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        omnisharp.enable = true;
        nil_ls.enable = true;
        lua-ls.enable = true;
        pyright.enable = true;
        ruff-lsp.enable = true;
        dartls.enable = true;
        bashls.enable = true;
        html = {
          enable = true;
          onAttach.function = ''
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          '';
        };
        cssls.enable = true;
        jsonls.enable = true;
        tsserver.enable = true;
        eslint.enable = true;
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
          "<leader>lR" = {
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

      lspconfig.marksman.setup {
        capabilities = ${capabilities}
      }

      lspconfig.sqls.setup {
        capabilities = ${capabilities},
        settings = {
          sqls = {
            connections = {},
          },
        },
      }

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
