{ pkgs, ... }:

{
  programs.gpu-screen-recorder.enable = true; # Remove need for password
  environment.systemPackages = with pkgs; [
    gpu-screen-recorder-gtk
  ];
}
