{ pkgs, globals, ... }:

{
  # TODO:
  # - use vscode extensions nix flake
  # - add C-j and C-k to jump between snippet completion

  # Install the following extensions manually:
  # - sqls
  # - SQL Formatter VSCode
  home.packages = with pkgs; [
    sqls
    sql-formatter
    ruff
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc # catppuccin
        catppuccin.catppuccin-vsc-icons # catppuccin icons
        vscodevim.vim # vim
        ms-vsliveshare.vsliveshare # live share
        esbenp.prettier-vscode # prettier (formatter)
        dbaeumer.vscode-eslint # eslint (js lint)
        ms-python.vscode-pylance # pylance (lsp)
        ms-python.debugpy # python debugger
        charliermarsh.ruff # python linter and formatter
      ];
      userSettings =
        let
          fontName = globals.font.name;
        in
        {
          # General
          "window.zoomLevel" = 1;
          "editor.formatOnSave" = true;
          "editor.fontSize" = 14;
          "editor.fontFamily" = "\'${fontName}\'";
          "security.workspace.trust.enabled" = false;
          "window.openFilesInNewWindow" = "default";
          "files.hotExit" = "off";
          "workbench.startupEditor" = "none";
          "window.restoreWindows" = "none";
          "git.openRepositoryInParentFolders" = "always";
          # Catppuccin
          "workbench.colorTheme" = "Catppuccin Mocha";
          "workbench.iconTheme" = "catppuccin-mocha";
          # Vim
          "vim.useSystemClipboard" = true;
          "vim.handleKeys" = {
            "<C-f>" = false;
          };
          "vim.leader" = "space";
          "vim.insertModeKeyBindings" = [
            {
              "before" = [
                "j"
                "k"
              ];
              "after" = [ "<Esc>" ];
            }
            {
              "before" = [
                "k"
                "j"
              ];
              "after" = [ "<Esc>" ];
            }
          ];
          "vim.normalModeKeyBindings" = [
            {
              "before" = [
                "leader"
                "w"
              ];
              "commands" = [
                "workbench.action.files.save"
              ];
            }
            {
              "before" = [
                "leader"
                "c"
              ];
              commands = [
                "workbench.action.closeActiveEditor"
              ];
            }
            {
              "before" = [ "K" ];
              "commands" = [
                "workbench.action.nextEditor"
              ];
            }
            {
              "before" = [ "J" ];
              "commands" = [
                "workbench.action.previousEditor"
              ];
            }
            {
              "before" = [ "alt+k" ];
              "commands" = [
                "workbench.action.moveEditorLeftInGroup"
              ];
            }
            {
              "before" = [ "alt+j" ];
              "commands" = [
                "workbench.action.moveEditorRightInGroup"
              ];
            }

          ];
          "vim.visualModeKeyBindings" = [
            {
              "before" = [ ">" ];
              "commands" = [ "editor.action.indentLines" ];
            }
            {
              "before" = [
                "<"
              ];
              "commands" = [ "editor.action.outdentLines" ];
            }
          ];
          # SQL Formatter VSCode
          "[sql]" = {
            "editor.defaultFormatter" = "ReneSaarsoo.sql-formatter-vsc";
          };
          "SQL-Formatter-VSCode.dialect" = "postgresql";
          "SQL-Formatter-VSCode.tabSizeOverride" = 4;
          "SQL-Formatter-VSCode.keywordCase" = "upper";
          "SQL-Formatter-VSCode.dataTypeCase" = "upper";
          "SQL-Formatter-VSCode.functionCase" = "upper";
          # ruff
          "[python]" = {
            "editor.defaultFormatter" = "charliermarsh.ruff";
          };
        };
      keybindings = [
        {
          "key" = "ctrl+tab";
          "command" = "workbench.action.nextEditor";
          "when" = "!activeEditorGroupEmpty";
        }
        {
          "key" = "ctrl+shift+tab";
          "command" = "workbench.action.previousEditor";
          "when" = "!activeEditorGroupEmpty";
        }
        # Use tab for completion
        {
          "key" = "tab";
          "command" = "selectNextSuggestion";
          "when" = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
        }
        {
          "key" = "down";
          "command" = "-selectNextSuggestion";
          "when" = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
        }
        {
          "key" = "shift+tab";
          "command" = "selectPrevSuggestion";
          "when" = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
        }
        {
          "key" = "up";
          "command" = "-selectPrevSuggestion";
          "when" = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
        }
      ];
    };
  };
}
