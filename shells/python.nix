{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  packages = with pkgs; [
    python3Full
    (poetry.override { python3 = python3Full; }) # override is required for tkinter
  ];
}
