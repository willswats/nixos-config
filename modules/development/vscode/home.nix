{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      vscodevim.vim
    ];
    userSettings = {
      # General
      "window.zoomLevel" = 1;
      "editor.formatOnSave" = true;
      "security.workspace.trust.enabled" = false;
      "window.openFilesInNewWindow" = "default";
      "files.hotExit" = "off";
      "workbench.startupEditor" = "none";
      "window.restoreWindows" = "none";
      # Catppuccin
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      # Vim
      "vim.useCtrlKeys" = false;
      "vim.useSystemClipboard" = true;
      "vim.insertModeKeyBindings" = [
        {
          "before" = [ "j" "k" ];
          "after" = [ "<Esc>" ];
        }
      ];
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

  # Set marketplace to the microsoft marketplace instead of open-vsx
  xdg.configFile."VSCodium/product.json" = {
    text = ''
      {
        "extensionsGallery": {
          "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
          "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
          "itemUrl": "https://marketplace.visualstudio.com/items"
        }
      }
    '';
  };
}
