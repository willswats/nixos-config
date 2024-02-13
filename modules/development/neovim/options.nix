{ ... }:

{
  programs.nixvim = {
    globals = {
      markdown_recommended_style = 0; # Removes `shiftwidth = 4` and `tabstop = 4` in markdown files
    };
    options = {
      backup = false; # Creates a backup file
      swapfile = false; # Creates a swapfile
      writebackup =
        false; # If a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
      clipboard = "unnamedplus"; # Allows neovim to access the system clipboard
      fileencoding = "utf-8"; # The encoding written to a file
      ignorecase = true; # Ignore case in search patterns
      mouse = "a"; # Allow the mouse to be used in neovim
      showmode =
        false; # If in Insert, Replace or Visual mode put a message on the last line
      smartcase =
        true; # Override the 'ignorecase' option if the search pattern contains upper case characters.
      splitbelow =
        true; # When on, splitting a window will put the new window below the current one
      splitright =
        true; # When on, splitting a window will put the new window right of the current one
      termguicolors = true; # Enables 24-bit RGB color in the TUI
      timeoutlen =
        500; # Time in milliseconds to wait for a mapped sequence to complete
      undofile =
        true; # When on, Vim automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read
      expandtab = true; # Convert tabs to spaces
      shiftwidth = 2; # Number of spaces to use for each step of (auto)indent.
      tabstop = 2; # Number of spaces that a <Tab> in the file counts for
      cursorline = true; # Highlight the text line of the cursor
      number = true; # Set numbered lines
      signcolumn =
        "yes"; # Always show the sign column otherwise it would shift the text each time
      wrap = false; # Display lines as one long line
      linebreak = false; # Companion to wrap, don't split words
      spell = false; # Spell check
      spelllang = "en_gb"; # Spell check language
      scrolloff =
        8; # Minimal number of screen lines to keep above and below the cursor
      sidescrolloff =
        8; # The minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set
    };
  };
}
