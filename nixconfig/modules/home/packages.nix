{ flake, pkgs, ... }:
let
  inherit (flake) inputs;
in
{
  home.packages = with pkgs; [
    age
    fd
    gnupg
    gnumake
    silver-searcher

    # Code
    chroma

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

    nixd
    zlib

    # writing
    typst

    # Demo time
    asciinema-agg # Convert asciinema to .gif
    asciinema # Terminal recorder

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal
    adrgen # ADR generator

    btop # replacement of htop/nmon
    iftop # network monitoring

    # system call monitoring
    lsof # list open files

    # system tools
    pciutils # lspci

    # orchestration
    process-compose

    # shell env manager
    # devenv
    inputs.devenv.packages.${stdenv.hostPlatform.system}.devenv

    # nix language server
    nil
    nixd

    # python package manager
    uv

    # On ubuntu, we need this less for `man home-configuration.nix`'s
    # pager to work.
    less

    tree

    # watch files sanely
    watchexec
  ];

  home.shellAliases = {
  };
}
