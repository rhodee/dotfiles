{ pkgs, ... }:

{
  # have fzf installed as well
  home.packages = with pkgs; [
    argocd
    dive
    linkerd
    # step-cli
    stern
  ];
}
