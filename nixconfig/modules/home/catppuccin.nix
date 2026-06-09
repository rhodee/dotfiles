{ flake, ... }:
{
  imports = [
    flake.inputs.catppuccin.homeModules.catppuccin
  ];

  config = {
    # catppuccin/nix 26.05 split the global toggle: `enable` is now a hard
    # master switch and `autoEnable` drives per-port enrollment. Preserve prior
    # behavior (no auto-enrollment; only explicitly enabled ports themed) by
    # pinning autoEnable to the old `enable` value (false) and flipping the new
    # master `enable` to true.
    catppuccin.enable = true;
    catppuccin.autoEnable = false;
    catppuccin.flavor = "frappe";
    catppuccin.opencode.enable = false;
  };
}
