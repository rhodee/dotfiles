{ flake, config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    aws-sam-cli
    aws-vault
    awscli2
  ];
}