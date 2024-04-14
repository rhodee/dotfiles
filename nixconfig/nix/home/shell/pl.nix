{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Code
    #
    # Go
    pkgs.go
    # node
    pkgs.nodePackages.nodejs
    pkgs.nodePackages.pnpm
    # pyhon
    (pkgs.python3.withPackages (python-pkgs: [ python-pkgs.pip python-pkgs.cookiecutter ]))
    # rust
    pkgs.cargo
  ];
}