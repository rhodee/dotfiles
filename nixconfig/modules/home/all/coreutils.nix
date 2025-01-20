{ flake, config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    uutils-coreutils-noprefix
  ];
}