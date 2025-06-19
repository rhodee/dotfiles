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
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "$EDITOR";
    XDG_CONFIG_HOME = "$HOME/.config";
  };
}
