{ flake, pkgs, lib, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
  ];

  home.username = "rhodee";
  home.homeDirectory = lib.mkDefault "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/rhodee";
  home.stateVersion = "22.11";
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "code --wait --new-window";
    VISUAL = "$EDITOR";
    # XDG_CONFIG_HOME = "$HOME/.config"
  };
}
