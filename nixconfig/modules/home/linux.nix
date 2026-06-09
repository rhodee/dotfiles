{ pkgs, ... }:
{
  imports = [
    ./editor/neovim
  ];

  home.packages = with pkgs; [
    asciicam # Terminal webcam — Linux-only (meta.platforms)
  ];
}
