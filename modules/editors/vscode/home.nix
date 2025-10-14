{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [
    # sql
    sqls
    sql-formatter
    # python
    ruff
    # nix
    nil
    nixfmt
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs; # Note: vscodium does not work with certain ms extensions (vsliveshare)
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      # Search for extensions:
      # https://marketplace.visualstudio.com
      # To see if an extension is in the overlay:
      # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/refs/heads/master/data/cache/vscode-marketplace-latest.json
      extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
        catppuccin.catppuccin-vsc # catppuccin
        catppuccin.catppuccin-vsc-icons # catppuccin icons
        jasew.vscode-helix-emulation # helix emulation
        ms-vsliveshare.vsliveshare # live share
        jnoortheen.nix-ide # nix
        esbenp.prettier-vscode # prettier (formatter)
        dbaeumer.vscode-eslint # eslint (js lint)
        ms-python.python # top-level python extension
        ms-python.vscode-pylance # pylance (lsp)
        ms-python.debugpy # python debugger
        ms-python.vscode-python-envs # python environments
        charliermarsh.ruff # python linter and formatter
        lighttiger2505.sqls # sqls
        renesaarsoo.sql-formatter-vsc # sql formatter
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
          "chat.disableAIFeatures" = true;
          # Catppuccin
          "workbench.colorTheme" = "Catppuccin Mocha";
          "workbench.iconTheme" = "catppuccin-mocha";
          # Helix
          "helixKeymap.toggleRelativeLineNumbers" = true;
          # SQL Formatter VSCode
          "SQL-Formatter-VSCode.dialect" = "postgresql";
          "SQL-Formatter-VSCode.tabSizeOverride" = 4;
          "SQL-Formatter-VSCode.keywordCase" = "upper";
          "SQL-Formatter-VSCode.dataTypeCase" = "upper";
          "SQL-Formatter-VSCode.functionCase" = "upper";
          # nix-ide
          "nix.enableLanguageServer" = true;
          # Set default formatters
          "[html]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[css]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[javascript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[javascriptreact]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[typescript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[typescriptreact]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[json]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[markdown]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[sql]" = {
            "editor.defaultFormatter" = "ReneSaarsoo.sql-formatter-vsc";
          };
          "[python]" = {
            "editor.defaultFormatter" = "charliermarsh.ruff";
          };
        };
      keybindings = [
        # Use the standard tab instead of the most recent tab menu
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
        # Use tab for moving through the completion menu
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
        # Helix
        {
          "key" = "ctrl+c";
          "command" = "editor.action.commentLine";
          "when" = "editorTextFocus && extension.helixKeymap.normalMode || editorTextFocus && extension.helixKeymap.visualMode";
        }
      ];
    };
  };
}
