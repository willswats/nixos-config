{ ... }:

{
  imports = [
    ./colorscheme.nix
    ./lsp.nix
    ./nvim-cmp.nix
    ./none-ls.nix
    ./nvim-tree.nix
    ./bufferline.nix
    ./lualine.nix
    ./telescope.nix
    ./noice.nix
    ./toggleterm.nix
    ./gitsigns.nix
    ./illuminate.nix
    ./indent-blankline.nix
    ./mkdnflow.nix
    ./vim-visual-multi.nix
    ./markdown-preview.nix
    ./dap.nix
  ];

  programs.nixvim.plugins = {
    treesitter.enable = true;
    which-key.enable = true;
    comment-nvim.enable = true;
    nvim-autopairs.enable = true;
    ts-autotag.enable = true;
  };
}
