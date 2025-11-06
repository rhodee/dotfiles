{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Code
    #
    # Go
    go
    gopls
    # Lua
    lua
    # node
    volta
    # pyhon
    (python3.withPackages (python-pkgs: [ python-pkgs.pip python-pkgs.pynvim ]))
    # rust
    rustup
  ];
}
