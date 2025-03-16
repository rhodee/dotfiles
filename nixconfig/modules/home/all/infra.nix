{ flake, config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    terraform
    terraform-docs
    terraform-ls
    terraformer
    # Marked as broken do not use 14-03-2025
    # terragrunt
  ];
}
