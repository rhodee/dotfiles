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

    # AI tools
    inputs.nix-ai-tools.packages.${stdenv.hostPlatform.system}.crush

    # Code
    chroma

    # sql
    duckdb

    # vpn - cli tool
    tailscale

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
    adrgen # ADR generator

    btop # replacement of htop/nmon
    iftop # network monitoring

    # system call monitoring
    lsof # list open files

    # system tools
    pciutils # lspci

    # orchestration
    process-compose

    # tailscale
    # defer to the UI based
    # version for each OS now
    # tailscale

    # shell env manager
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
