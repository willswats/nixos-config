{ ... }:

let
  icons = import ../../icons.nix;
in
{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    settings = {
      appearance.kind_icons = icons.kind;
      completion = {
        accept.auto_brackets.enabled = true;
        documentation.auto_show = true;
        list.selection = {
          preselect = false;
          auto_insert = true;
        };
      };
      sources = {
        default = [
          "lsp"
          "buffer"
          "snippets"
          "path"
        ];
      };
      snippets = {
        preset = "luasnip";
      };
      keymap = {
        "<C-space>" = [
          "show"
          "show_documentation"
          "hide_documentation"
        ];
        "<C-e>" = [
          "hide"
          "fallback"
        ];
        "<CR>" = [
          "accept"
          "fallback"
        ];

        "<C-j>" = [
          "snippet_forward"
          "fallback"
        ];
        "<C-k>" = [
          "snippet_backward"
          "fallback"
        ];

        "<Down>" = [
          "select_next"
          "fallback"
        ];
        "<Up>" = [
          "select_prev"
          "fallback"
        ];
        "<Tab>" = [
          "select_next"
          "fallback_to_mappings"
        ];
        "<S-Tab>" = [
          "select_prev"
          "fallback_to_mappings"
        ];

        "<C-u>" = [
          "scroll_documentation_up"
          "fallback"
        ];
        "<C-d>" = [
          "scroll_documentation_down"
          "fallback"
        ];

        "<C-s>" = [
          "show_signature"
          "hide_signature"
          "fallback"
        ];
      };
    };
  };
}
