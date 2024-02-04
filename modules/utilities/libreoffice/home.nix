{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    # Required for spell checking
    hunspell
    hunspellDicts.en_GB-ise
  ];
}
