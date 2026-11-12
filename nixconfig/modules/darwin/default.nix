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

  # Fish as the login shell (also registers it in /etc/shells)
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];
  users.users."rhodee".shell = pkgs.fish;

  # Back up pre-existing files (e.g. ~/.zshrc) instead of failing activation
  home-manager.backupFileExtension = "hm-backup";

  # Disable nix-darwin's management of Nix
  nix.enable = false;

  # These users can add Nix caches.
  nix.settings = {
    trusted-users = [ "root" "rhodee" ];
    require-sigs = true;  # Verify binary cache signatures for security
  };
}
