{ pkgs, ... }:

{
  # have fzf installed as well
  home.packages = with pkgs; [
    dive
  ];
}
