{ inputs, ... }:
{
  home.stateVersion = "22.11";
  imports = [
    ./all/zsh.nix
    ./all/iterm
    ./git
    ./editor/neovim
    # ./editor/zed
  ];
}
