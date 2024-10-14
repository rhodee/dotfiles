{ flake, config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    terraform
    terraform-docs
    terraform-ls
    terraformer
    terragrunt
  ];
}
