{ config, ... }:

{
  programs.nixvim = {
    keymaps =
      let
        cr = "<CR>";
        cmd = "<CMD>";

        normal =
          let
            mode = "n";
          in
          [
            {
              inherit mode;
              key = "<leader>mc";
              action = "${cmd}MkdnToggleToDo${cr}";
              options.desc = "Checkbox toggle";
            }
          ];

        visual =

          let
            mode = "v";
          in
          [
            {
              inherit mode;
              key = "<leader>mc";
              action = "${cmd}MkdnToggleToDo${cr}";
              options.desc = "Checkbox toggle";
            }
          ];
      in
      config.nixvim.helpers.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal ++ visual);

    plugins.mkdnflow = {
      enable = true;
      toDo = {
        symbols = [ " " "x" " " ];
        updateParents = false;
        notStarted = " ";
        inProgress = " ";
        complete = "x";
      };

      mappings = {
        MkdnEnter = { modes = [ "n" "v" ]; key = "<CR>"; };
        MkdnTab = false;
        MkdnSTab = false;
        MkdnNextLink = { modes = "n"; key = "<Tab>"; };
        MkdnPrevLink = { modes = "n"; key = "<S-Tab>"; };
        MkdnNextHeading = { modes = "n"; key = "]]"; };
        MkdnPrevHeading = { modes = "n"; key = "[["; };
        MkdnGoBack = false;
        MkdnGoForward = false;
        MkdnFollowLink = false; # see MkdnEnter 
        MkdnCreateLink = false; # see MkdnEnter 
        MkdnCreateLinkFromClipboard = false;
        MkdnDestroyLink = false;
        MkdnMoveSource = false;
        MkdnYankAnchorLink = false;
        MkdnYankFileAnchorLink = false;
        MkdnIncreaseHeading = { modes = "n"; key = "+"; };
        MkdnDecreaseHeading = { modes = "n"; key = "-"; };
        MkdnToggleToDo = false;
        MkdnNewListItem = false;
        MkdnNewListItemBelowInsert = { modes = "n"; key = "o"; };
        MkdnNewListItemAboveInsert = { modes = "n"; key = "O"; };
        MkdnExtendList = false;
        MkdnUpdateNumbering = false;
        MkdnTableNextCell = false;
        MkdnTablePrevCell = false;
        MkdnTableNextRow = false;
        MkdnTablePrevRow = false;
        MkdnTableNewRowBelow = false;
        MkdnTableNewRowAbove = false;
        MkdnTableNewColAfter = false;
        MkdnTableNewColBefore = false;
        MkdnFoldSection = false;
        MkdnUnfoldSection = false;
      };
    };
  };
}
