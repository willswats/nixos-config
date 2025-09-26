{ ... }:

{
  programs.nyaa = {
    enable = true;
    default_theme = "Catppuccin Macchiato";

    source.nyaa = {
      default_sort = "Seeders";
    };
  };
}
