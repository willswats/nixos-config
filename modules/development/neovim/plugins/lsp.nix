{ pkgs, config, ... }:

let
  icons = import ../icons.nix;
  capabilities = "require('cmp_nvim_lsp').default_capabilities()";
in
{
  home.packages = with pkgs; [
    gcc # rustup dependency
    rustup # Provides rust-analyzer
    nil # Nix LSP
    lua-language-server # Lua language server and formatter
    marksman # Markdown lsp
    nodePackages.bash-language-server # Bash LSP
    nodePackages.vscode-html-languageserver-bin # HTML LSP
    nodePackages.vscode-css-languageserver-bin # CSS LSP
    nodePackages.vscode-json-languageserver # JSON LSP
    nodePackages.typescript-language-server # TypeScript LSP
    nodePackages.eslint # JS, TS Linter
  ];

  programs.nixvim = {
    maps =
      let
        cr = "<CR>";
        cmd = "<CMD>";
      in
      config.nixvim.helpers.mkMaps { silent = true; } {
        normal = {
          "<leader>i" = {
            action = "${cmd}LspInfo${cr}";
            desc = "LSP Info";
          };
        };
      };
    plugins.lsp = {
      enable = true;
      servers = {
        rust-analyzer.enable = true;
        nil_ls.enable = true;
        lua-ls.enable = true;
        bashls.enable = true;
        html.enable = true;
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
          "<leader>lr" = {
            action = "rename";
            desc = "Rename";
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
