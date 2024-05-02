{ flake, config, lib, pkgs, ... }:
{
  programs.awscli = {
    enable = true;
  };
}