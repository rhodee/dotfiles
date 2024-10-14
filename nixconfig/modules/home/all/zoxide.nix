{ flake, config, lib, pkgs, ... }:
{
  # Type `z <pat>` to cd to some directory
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}