{ pkgs, ... }:

{
  # have fzf installed as well
  home.packages = with pkgs; [
    cue
    cuelsp
    dive
    k9s
    kubectx
    kustomize
    mkcert
    stern
  ];
}
