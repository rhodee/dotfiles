{ ... }:
{
  home.stateVersion = "25.11";
  imports = [
    ./all/zsh.nix
    ./editor/neovim
  ];
}
