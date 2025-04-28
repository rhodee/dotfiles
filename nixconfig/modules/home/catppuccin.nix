{ flake, ... }:
{
  imports = [
    flake.inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin.flavor = "frappe";
}