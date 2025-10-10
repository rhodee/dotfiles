# This is used on WSL2 environment
# Be sure to set the shell to fish
# chsh -s $(which fish)
{ flake, pkgs, lib, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
    # inputs.ghostty.packages.x86_64-linux.default
  ];

  home.username = "rhodee";
  home.homeDirectory = lib.mkDefault "/home/rhodee";
  home.stateVersion = "24.11";

  nixpkgs.hostPlatform = "x86_64-linux";
  networking.hostName = "rhodeewins";
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "$EDITOR";
  };

  # For home-manager to work.
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565487545
  users.users."rhodee".home = "/home/rhodee";

  home-manager.sharedModules = [
    self.homeModules.default
    self.homeModules.linux
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  system.stateVersion = 5;
  system.primaryUser = "rhodee";
}
