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
    kubefirst
    kustomize
    linkerd
    # step-cli
    stern
  ];
}
