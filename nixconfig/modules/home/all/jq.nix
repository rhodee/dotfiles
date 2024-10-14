{ flake, config, lib, pkgs, ... }:
{
  # Type `<ctrl> + r` to fuzzy search your shell history
  programs.jq = {
    enable = true;
  };
}