{ flake, pkgs, ... }:
let
  inherit (flake) inputs;
in
{
  home.packages = with pkgs; [
    kubie
  ];
}
