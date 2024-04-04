{ pkgs, ... }:

{
  home.packages = with pkgs; [
    age
    bottom
    fd
    ripgrep
    tmux
    tree
    gnupg

    # Code
    chroma
    bun

    # sql
    duckdb

    # fetch
    wget
    openssh
    curl

    # archives
    zip
    xz
    unzip
    p7zip

    # Demo time
    asciicam # Terminal webcam
    asciinema-agg # Convert asciinema to .gif
    asciinema # Terminal recorder

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal

    btop # replacement of htop/nmon
    iftop # network monitoring

    # system call monitoring
    lsof # list open files

    # system tools
    pciutils # lspci

    # node tooling
    pkgs.nodePackages.nodejs
    pkgs.nodePackages.neovim
    # template tool
    (pkgs.python3.withPackages (python-pkgs: [ python-pkgs.pip python-pkgs.cookiecutter ]))
  ];
}
