{ pkgs, ... }:

{
  # have fzf installed as well
  home.packages = with pkgs; [
    cue
    cuelsp
  ];
}
