{ ... }:

{
  imports = [
    # Language
    ./language/lsp.nix
    ./language/luasnip.nix
    ./language/blink-cmp.nix
    ./language/none-ls.nix
    ./language/treesitter.nix
    ./language/dap.nix
    # UI
    ./ui/bufferline.nix
    ./ui/lualine.nix
    ./ui/noice.nix
    ./ui/nvim-tree.nix
    ./ui/telescope.nix
    ./ui/toggleterm.nix
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
    web-devicons.enable = true;
    ts-comments.enable = true;
    ts-autotag.enable = true;
    nvim-autopairs.enable = true;
    nvim-surround.enable = true;
    friendly-snippets.enable = true;
  };
}
