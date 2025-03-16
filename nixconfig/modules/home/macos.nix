{ inputs, ... }:
{
  home.stateVersion = "24.11";
  imports = [
    ./all/zsh.nix
    ./all/iterm
    ./editor/helix
    # ./editor/neovim
    # ./editor/vscode
    # Marked as broken do not use 27-11-2024
    # ./editor/zed
  ];
}
