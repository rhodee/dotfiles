# This is used on WSL2 environment
# Be sure to set the shell to fish
# chsh -s $(which fish)
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
    self.homeModules.linux
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  networking.hostName = "rhodeewins";

  # For home-manager to work.
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565487545
  users.users."rhodee".home = "/home/rhodee";

  # Enable home-manager for "rhodee" user
  home-manager.users."rhodee" = {
    imports = [ (self + /configurations/home/rhodee.nix) ];
  };

  home-manager.sharedModules = [];

  # Used for backwards compatibility, please read the changelog before changing.
  system.stateVersion = 4;
}
