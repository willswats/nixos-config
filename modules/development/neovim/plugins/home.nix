{ ... }:

{
  imports = [
    # Language-related
    ./lsp.nix
    ./nvim-cmp.nix
    ./none-ls.nix
    ./inc-rename.nix
    # UI
    ./colorscheme.nix
    ./nvim-tree.nix
    ./bufferline.nix
    ./lualine.nix
    ./telescope.nix
    ./which-key.nix
    ./dap.nix
    ./noice.nix
    ./toggleterm.nix
    # QoL
    ./gitsigns.nix
    ./illuminate.nix
    ./indent-blankline.nix
    ./multicursors.nix
    ./auto-session.nix
    ./nvim-colorizer.nix
    # Markdown
    ./mkdnflow.nix
    ./markdown-preview.nix
    # Python
    ./venv-selector.nix
  ];

  programs.nixvim.plugins = {
    treesitter.enable = true;
    comment.enable = true;
    nvim-autopairs.enable = true;
    ts-autotag.enable = true;
  };
}
