{ flake, config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    aws-vault
    awscli2
  ];
}