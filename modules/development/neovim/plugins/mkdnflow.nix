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
        MkdnEnter = {
          modes = [
            "n"
            "v"
          ];
          key = "<CR>";
        };
        MkdnTab = false;
        MkdnSTab = false;
        MkdnNextLink = {
          modes = "n";
          key = "<Tab>";
        };
        MkdnPrevLink = {
          modes = "n";
          key = "<S-Tab>";
        };
        MkdnNextHeading = {
          modes = "n";
          key = "]]";
        };
        MkdnPrevHeading = {
          modes = "n";
          key = "[[";
        };
        MkdnGoBack = false;
        MkdnGoForward = false;
        MkdnFollowLink = false; # see MkdnEnter
        MkdnCreateLink = false; # see MkdnEnter
        MkdnCreateLinkFromClipboard = false;
        MkdnDestroyLink = false;
        MkdnMoveSource = false;
        MkdnYankAnchorLink = false;
        MkdnYankFileAnchorLink = false;
        MkdnIncreaseHeading = {
          modes = "n";
          key = "+";
        };
        MkdnDecreaseHeading = {
          modes = "n";
          key = "-";
        };
        MkdnToggleToDo = {
          modes = [
            "n"
            "v"
          ];
          key = "<C-Space>";
        };
        MkdnNewListItem = false;
        MkdnNewListItemBelowInsert = {
          modes = "n";
          key = "o";
        };
        MkdnNewListItemAboveInsert = {
          modes = "n";
          key = "O";
        };
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
