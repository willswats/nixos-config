{ pkgs, config, ... }:

let icons = import ../icons.nix;
in {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ friendly-snippets ];
    plugins = {
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-nvim-lua.enable = true;
      cmp_luasnip.enable = true;
      luasnip = {
        enable = true;
        settings = {
          # Events on which to leave the current snippet-root if the cursor is outside its’ 'region'.
          # Disabled by default, `'CursorMoved'`, `'CursorHold'` or `'InsertEnter'`
          region_check_events = "InsertEnter";
          # When to check if the current snippet was deleted, and if so, remove it from the history.
          # Off by default, `'TextChanged'` (perhaps 'InsertLeave'`, to react to changes done in Insert mode) should work just fine
          delete_check_events = "InsertLeave";
        };
        fromVscode = [
          { } # generates: require("luasnip.loaders.from_vscode").lazy_load({})
        ];
      };

      cmp = {
        enable = true;
        settings = {
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
          mapping = {
            "<C-k>" = "cmp.mapping.scroll_docs(-4)";
            "<C-j>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = ''
              function(fallback)
                local luasnip = require("luasnip")
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end
            '';
            "<S-Tab>" = ''
              function(fallback)
                local luasnip = require("luasnip")
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end
            '';
            "<CR>" = "cmp.mapping.confirm({ select = false })";
          };
          formatting = {
            fields = [ "abbr" "kind" "menu" ];
            format = ''
              function(_, vim_item)
                icons_kind = ${config.lib.nixvim.toLuaObject icons.kind}
                vim_item.kind = (icons_kind[vim_item.kind] or "") .. " " .. vim_item.kind
                return vim_item
              end
            '';
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "nvim_lua"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
        };
      };
    };
    # Insert `(` after selecting a function or method item
    extraConfigLua = ''
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    '';
  };
}
