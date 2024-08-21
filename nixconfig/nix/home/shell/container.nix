{ pkgs, ... }:

{
  # have fzf installed as well
  home.packages = with pkgs; [
    argocd
    dive
    k9s
    kind
    krew
    kubectx
    kustomize
    linkerd
    mkcert
    stern
    tilt
  ];
}
