{ pkgs, config, ... }:

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

  programs.nixvim = {
    maps =
      let
        cr = "<CR>";
        cmd = "<CMD>";
      in
      config.nixvim.helpers.mkMaps { silent = true; } {
        normal = {
          "<leader>lj".action = "${cmd}lua vim.diagnostic.goto_next()${cr}";
          "<leader>lk".action = "${cmd}lua vim.diagnostic.goto_prev()${cr}";
          "<leader>lf".action = "${cmd}lua vim.diagnostic.open_float()${cr}";
          "<leader>la".action = "${cmd}lua vim.lsp.buf.code_action()${cr}";
          "<leader>li".action = "${cmd}lua vim.lsp.buf.implementation()${cr}";
          "<leader>lr".action = "${cmd}lua vim.lsp.buf.rename()${cr}";
          "<leader>lR".action = "${cmd}lua vim.lsp.buf.references()${cr}";
          "<leader>lh".action = "${cmd}lua vim.lsp.buf.hover()${cr}";
        };
      };
    plugins.lsp = {
      enable = true;
      servers = {
        rust-analyzer.enable = true;
        nil_ls.enable = true;
        lua-ls.enable = true;
        tsserver.enable = true;
        eslint.enable = true;
      };
    };
    extraConfigLua = ''
      local lspconfig = require("lspconfig")
      lspconfig.marksman.setup {}

      local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn",  text = "" },
        { name = "DiagnosticSignHint",  text = "" },
        { name = "DiagnosticSignInfo",  text = "" },
      }

      for _, sign in pairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end
    '';
  };
}
