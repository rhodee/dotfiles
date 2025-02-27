# This is your nix-darwin configuration.
# For home configuration, see /modules/home/*
{
  flake,
  pkgs,
  lib,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    # Services

    # System
    ./system.nix
  ];

  # Use TouchID for `sudo` authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # These users can add Nix caches.
  nix.settings.trusted-users = [ "root" "rhodee" ];
}
