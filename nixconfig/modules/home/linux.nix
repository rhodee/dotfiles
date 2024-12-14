{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./git
    # ./editor/neovim
    # Marked as broken do not use 27-11-2024
    # ./editor/zed
    # ./editor/vscode
  ];
}
