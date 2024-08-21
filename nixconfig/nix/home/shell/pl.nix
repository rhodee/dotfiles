{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Code
    #
    # Go
    pkgs.go
    # Lua
    pkgs.lua
    # node
    pkgs.volta
    # pyhon
    (pkgs.python3.withPackages (python-pkgs: [ python-pkgs.pip python-pkgs.cookiecutter python-pkgs.pynvim ]))
    # rust
    pkgs.cargo
  ];
}
