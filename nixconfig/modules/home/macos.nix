{ inputs, ... }:
{
  home.stateVersion = "22.11";
  imports = [
    ./all/zsh.nix
    ./all/iterm
    ./git
    # ./editor/neovim
    # ./editor/vscode
    # Marked as broken do not use 27-11-2024
    # ./editor/zed
  ];
}
