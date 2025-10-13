{ ... }:

{
  imports = [
    # Language
    ./language/lsp.nix
    ./language/treesitter.nix
    ./language/luasnip.nix
    ./language/blink-cmp.nix
    ./language/none-ls.nix
    ./language/dap.nix
    # UI
    ./ui/bufferline.nix
    ./ui/lualine.nix
    ./ui/yazi.nix
    ./ui/telescope.nix
    ./ui/which-key.nix
    # QoL
    ./qol/auto-session.nix
    ./qol/ccc.nix
    ./qol/gitsigns.nix
    ./qol/illuminate.nix
    ./qol/inc-rename.nix
    ./qol/indent-blankline.nix
    ./qol/multicursors.nix
    ./qol/venv-selector.nix
    # Markdown
    ./markdown/markdown-preview.nix
    ./markdown/mkdnflow.nix
  ];

  programs.nixvim.plugins = {
    # UI
    web-devicons.enable = true;
    # Language
    friendly-snippets.enable = true;
    ts-comments.enable = true;
    ts-autotag.enable = true;
    nvim-autopairs.enable = true;
    nvim-surround.enable = true;
  };
}
