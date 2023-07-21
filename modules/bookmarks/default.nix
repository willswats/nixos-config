{ config, pkgs, ... }:

let
  bookmarkStart = "file:///home/will/";
in
{
  gtk.gtk3.bookmarks = [
    "${bookmarkStart}Downloads Downloads"
    "${bookmarkStart}AppImages AppImages"
    "${bookmarkStart}Code Code"
    "${bookmarkStart}Emulation Emulation"
  ];
}
