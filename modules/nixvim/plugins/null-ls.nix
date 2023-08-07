{ pkgs, ... }:

{
  programs.nixvim = {
    extraPackages = with pkgs; [
      nixpkgs-fmt # Nix formatter
      nodePackages.prettier # Code formatter for many languages
      nodePackages.markdownlint-cli # Markdown linter
    ];
    # Not defined using the module as `diagnostics.markdownlint` does not exist in it
    # https://github.com/nix-community/nixvim/issues/97
    extraPlugins = with pkgs.vimPlugins; [ null-ls-nvim ];
    extraConfigLua = ''
      local status_ok_null_ls, null_ls = pcall(require, "null-ls")
      if not status_ok_null_ls then
        return
      end

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        debug = false,
        sources = {
          formatting.prettier,
          formatting.nixpkgs_fmt,
          diagnostics.markdownlint.with({ extra_args = { "--disable", "MD013" } })
        },
      })
    '';
  };
}
