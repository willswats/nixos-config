{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ mkdnflow-nvim ];
    extraConfigLua = ''
      require("mkdnflow").setup({
        modules = {
          bib = true,
          buffers = true,
          conceal = true,
          cursor = true,
          folds = true,
          links = true,
          lists = true,
          maps = true,
          paths = true,
          tables = true,
          yaml = false
        },
        filetypes = { md = true, rmd = true, markdown = true },
        create_dirs = true,
        perspective = {
          priority = "first",
          fallback = "current",
          root_tell = false,
          nvim_wd_heel = false,
          update = false
        },
        wrap = false,
        bib = {
          default_path = nil,
          find_in_root = true
        },
        silent = false,
        links = {
          style = "markdown",
          name_is_source = false,
          conceal = false,
          context = 0,
          implicit_extension = nil,
          transform_implicit = false,
          transform_explicit = function(text)
            text = text:gsub(" ", "-")
            text = text:lower()
            text = os.date("%Y-%m-%d_") .. text
            return (text)
          end
        },
        to_do = {
          symbols = { " ", "x", " " },
          update_parents = true,
          not_started = " ",
          in_progress = " ",
          complete = "x"
        },
        tables = {
          trim_whitespace = true,
          format_on_move = true,
          auto_extend_rows = false,
          auto_extend_cols = false
        },
        yaml = {
          bib = { override = false }
        },
        mappings = {
          MkdnEnter = { { "n", "v" }, "<CR>" },
          MkdnTab = false,
          MkdnSTab = false,
          MkdnNextLink = { "n", "ml" },
          MkdnPrevLink = { "n", "mL" },
          MkdnNextHeading = { "n", "mh" },
          MkdnPrevHeading = { "n", "mH" },
          MkdnGoBack = false,
          MkdnGoForward = false,
          MkdnCreateLink = false,
          MkdnCreateLinkFromClipboard = false,
          MkdnFollowLink = false,
          MkdnDestroyLink = false,
          MkdnTagSpan = false,
          MkdnMoveSource = false,
          MkdnYankAnchorLink = false,
          MkdnYankFileAnchorLink = false,
          MkdnIncreaseHeading = false,
          MkdnDecreaseHeading = false,
          MkdnToggleToDo = { { "n", "v" }, "mt" },
          MkdnNewListItem = false,
          MkdnNewListItemBelowInsert = { "n", "o" },
          MkdnNewListItemAboveInsert = { "n", "O" },
          MkdnExtendList = false,
          MkdnUpdateNumbering = false,
          MkdnTableNextCell = false,
          MkdnTablePrevCell = false,
          MkdnTableNextRow = false,
          MkdnTablePrevRow = false,
          MkdnTableNewRowBelow = false,
          MkdnTableNewRowAbove = false,
          MkdnTableNewColAfter = false,
          MkdnTableNewColBefore = false,
          MkdnFoldSection = { "n", "mf" },
          MkdnUnfoldSection = { "n", "mF" }
        }
      })
    '';
  };
}
