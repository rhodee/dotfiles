{ flake, config, lib, pkgs, ... }:
{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    defaultCommand = "rg --files --follow --hidden --glob '!.git/'";
  };
}