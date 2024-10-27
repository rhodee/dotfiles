{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./git
    ./editor/neovim
    # ./editor/zed
  ];
}
