# See /modules/darwin/* for actual settings
# This file is just *top-level* configuration.
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    inputs.mac-app-util.darwinModules.default
    self.darwinModules.default
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "rhodeebook";
  nixpkgs.config.allowUnfree = true;

  # For home-manager to work.
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565487545
  users.users."rhodee".home = "/Users/rhodee";

  # Enable home-manager for "rhodee" user
  home-manager.users."rhodee" = {
    imports = [ (self + /configurations/home/rhodee.nix) ];
  };

  home-manager.sharedModules = [
    self.homeModules.default
    self.homeModules.macos
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
