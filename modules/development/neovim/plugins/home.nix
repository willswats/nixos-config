{ ... }:

{
  imports = [
    # Essential
    ./essential/cmp.nix
    ./essential/lsp.nix
    ./essential/none-ls.nix
    ./essential/treesitter.nix
    # Extra
    ./extra/auto-session.nix
    ./extra/ccc.nix
    ./extra/gitsigns.nix
    ./extra/illuminate.nix
    ./extra/inc-rename.nix
    ./extra/indent-blankline.nix
    ./extra/multicursors.nix
    ./extra/venv-selector.nix
    # Markdown
    ./markdown/markdown-preview.nix
    ./markdown/mkdnflow.nix
    # UI
    ./ui/bufferline.nix
    ./ui/dap.nix
    ./ui/lualine.nix
    ./ui/noice.nix
    ./ui/nvim-tree.nix
    ./ui/telescope.nix
    ./ui/toggleterm.nix
    ./ui/which-key.nix
  ];

  programs.nixvim.plugins = {
    comment.enable = true;
    nvim-autopairs.enable = true;
    ts-autotag.enable = true;
    web-devicons.enable = true;
    render-markdown.enable = true;
  };
}
