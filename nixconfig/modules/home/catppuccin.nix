{ flake, ... }:
{
  imports = [
    flake.inputs.catppuccin.homeManagerModules.catppuccin
  ];

  catppuccin.flavor = "frappe";
}