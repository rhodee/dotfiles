{ flake, config, lib, pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    # Upstream direnv 2.37.1 fish test suite gets OOM-killed in the Nix
    # sandbox on aarch64-darwin. Skip tests; the binary is fine.
    package = pkgs.direnv.overrideAttrs (_: { doCheck = false; });
  };
}
