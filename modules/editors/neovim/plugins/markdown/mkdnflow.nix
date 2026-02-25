{ ... }:

{
  programs.nixvim.plugins.mkdnflow = {
    enable = true;
    settings = {
      to_do = {
        symbols = [
          " "
          "x"
          " "
        ];
        update_parents = false;
        not_started = " ";
        in_progress = " ";
        complete = "x";
      };
      mappings = {
        MkdnEnter = [ [ "n" "v" ] "<CR>" ];
        MkdnTab = false;
        MkdnSTab = false;
        MkdnNextLink = [
          "n"
          "<Tab>"
        ];
        MkdnPrevLink = [
          "n"
          "<S-Tab>"
        ];
        MkdnNextHeading = [
          "n"
          "]]"
        ];
        MkdnPrevHeading = [
          "n"
          "[["
        ];
        MkdnGoBack = false;
        MkdnGoForward = false;
        MkdnFollowLink = false; # see MkdnEnter
        MkdnCreateLink = false; # see MkdnEnter
        MkdnCreateLinkFromClipboard = false;
        MkdnDestroyLink = false;
        MkdnMoveSource = false;
        MkdnYankAnchorLink = false;
        MkdnYankFileAnchorLink = false;
        MkdnIncreaseHeading = [
          "n"
          "+"
        ];
        MkdnDecreaseHeading = [
          "n"
          "-"
        ];
        MkdnToggleToDo = [
          [
            "n"
            "v"
          ]
          "<C-Space>"
        ];
        MkdnNewListItem = false;
        MkdnNewListItemBelowInsert = [
          "n"
          "o"
        ];
        MkdnNewListItemAboveInsert = [
          "n"
          "O"
        ];
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
