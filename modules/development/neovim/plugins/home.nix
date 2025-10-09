{ ... }:

{
  imports = [
    # Language
    ./language/cmp.nix
    ./language/lsp.nix
    ./language/none-ls.nix
    ./language/treesitter.nix
    # UI
    ./ui/bufferline.nix
    ./ui/dap.nix
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
    ts-comments.enable = true;
    nvim-autopairs.enable = true;
    ts-autotag.enable = true;
    web-devicons.enable = true;
    render-markdown.enable = true;
  };
}
