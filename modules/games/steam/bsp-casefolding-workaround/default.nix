{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # TODO: add back vpkedit
    # vpkedit
  ];
}
