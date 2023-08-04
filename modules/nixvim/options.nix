{ ... }:

{
  programs.nixvim.options = {
    backup = false; # Creates a backup file
    swapfile = false; # Creates a swapfile
    clipboard = "unnamedplus"; # Allows neovim to access the system clipboard
    number = true; # Show numbered lines
    tabstop = 2; # Insert two spaces for a tab
    cursorline = true; # Highlight the current line
  };
}
