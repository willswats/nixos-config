{ config, pkgs, ... }:

{
  gtk.gtk3.bookmarks =
    let
      bookmarkStart = "file:///home/will/";
    in
    [
      "${bookmarkStart}Downloads Downloads"
      "${bookmarkStart}AppImages AppImages"
      "${bookmarkStart}Code Code"
    ];
}