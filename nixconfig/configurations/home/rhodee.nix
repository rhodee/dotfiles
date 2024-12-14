{ flake, pkgs, lib, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
    self.homeModules.linux
  ];

  home.username = "rhodee";
  home.homeDirectory = lib.mkDefault "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/rhodee";
  home.stateVersion = "22.11";

  home.sessionVariables = {
    EDITOR = "code --wait --new-window";
    VISUAL = "$EDITOR";
  };
}
