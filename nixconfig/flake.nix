{
  description = "A home-manager template providing useful tools & settings for Nix-based development";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    systems = import inputs.systems;
    imports = [
      inputs.nixos-flake.flakeModule
    ];

    perSystem = { self', config, lib, pkgs, home-manager, ... }:
      let
        itsme = "denisrhoden";
        inherit (pkgs) stdenv;
        inherit (lib) mkIf;
      in
      {
        legacyPackages.homeConfigurations.${itsme} =
          inputs.self.nixos-flake.lib.mkHomeConfiguration
            pkgs
            ({ pkgs, ... }: {
              # Edit the contents of the ./home directory to install packages and modify dotfile configuration in your
              # $HOME.
              #
              # https://nix-community.github.io/home-manager/index.html#sec-usage-configuration
              imports = [ ./home ];
              home.username = itsme;
              home.homeDirectory = "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/${itsme}";
              home.stateVersion = "22.11";

              programs.home-manager.enable = true;
            });

        formatter = pkgs.nixpkgs-fmt;

        # Enables 'nix run' to activate.
        apps.default.program = self'.packages.activate-home;

        # Enable 'nix build' to build the home configuration, but without
        # activating.
        packages.default = self'.legacyPackages.homeConfigurations.${itsme}.activationPackage;
      };
  };
}
