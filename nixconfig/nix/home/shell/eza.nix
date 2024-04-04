{ flake, config, lib, pkgs, ... }:
{
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };
}