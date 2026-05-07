{ flake, pkgs, ... }:
let
  inherit (flake) inputs;
in
{
  home.packages = with pkgs; [
    k9s
    kind
    krew
    kubectx
    kubie
    kustomize
  ];
}
