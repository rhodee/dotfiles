{ pkgs, ... }:

{
  home.packages = with pkgs; [
    age
    fd
    tmux
    gnupg
    gnumake

    # Code
    chroma

    # sql
    duckdb
    dbeaver-bin

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

    # Github Action testing locally
    act

    # tailscale
    tailscale

    # File manager
    yazi

    # shell env manager
    devenv

    # prompts
    ollama

    # On ubuntu, we need this less for `man home-configuration.nix`'s
    # pager to work.
    less

    # watch files sanely
    watchexec
  ];
  home.shellAliases = {
    tree = "broot";
  };
}
