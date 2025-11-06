# See /modules/darwin/* for actual settings
# This file is just *top-level* configuration.
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
  # Use gitui from stable nixpkgs (0.26.3) to avoid sha1-asm build issues in 0.27.0
  pkgs-stable = import inputs.nixpkgs-stable {
    system = "aarch64-darwin";
    config.allowUnfree = true;
  };
in
{
  imports = [
    # Temporarily disabled due to SBCL iterate library 404 error
    # See: https://github.com/hraban/mac-app-util/issues/39
    # inputs.mac-app-util.darwinModules.default
    # inputs.ghostty.packages.aarch64-darwin.default
    self.darwinModules.default
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "rhodeework";
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
    # Override gitui to use stable version
    { programs.gitui.package = pkgs-stable.gitui; }
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
  system.primaryUser = "rhodee";
}
