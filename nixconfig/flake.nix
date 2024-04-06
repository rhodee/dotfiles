{
  description = "A home-manager template providing useful tools & settings for Nix-based development";

  inputs = {
    # Principle inputs (updated by `nix run .#update`)
    nixpkgs-unstable.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.0.tar.gz";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";
    systems.url = "github:nix-systems/default";

    # Software inputs
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, ... }: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    systems = import inputs.systems;
    imports = [
      inputs.nixos-flake.flakeModule
    ];

    # Configurations for (non-NixOS) Linux machines
    perSystem = { pkgs, ... }:
      let
        # TODO: change username
        uname = "rhodee";
      in
      {
        legacyPackages.homeConfigurations.${uname} =
          self.nixos-flake.lib.mkHomeConfiguration
            pkgs
            ({ pkgs, ... }: {
              imports = [
                self.nixosModules.common
                self.homeModules.common
                self.homeModules.linux
              ];
              home.stateVersion = "22.11";
              home.username = "${uname}";
              home.homeDirectory = "/home/${uname}";
            });
      };


    flake =
      let
        # TODO: change username
        itsMe = "rhodee";
      in {
        # Configurations for (NixOS) Linux machines
        # nixosConfigurations = {
        #   rhodeenix = self.nixos-flake.lib.mkLinuxSystem {
        #     nixpkgs.hostPlatform = "x86_64-linux";
        #     imports = [
        #       self.nixosModules.common
        #       self.nixosModules.linux
        #       ({ pkgs, ... }: {
        #         system.stateVersion = "23.05";
        #       })
        #       # Your home-manager configuration
        #       self.nixosModules.home-manager
        #       {
        #         home-manager.users.${itsMe} = {
        #           imports = [
        #             self.homeModules.common
        #             self.homeModules.linux
        #           ];
        #           home.stateVersion = "22.11";
        #         };
        #       }
        #     ];
        #   };
        # };

        # Configurations for macOS machines
        darwinConfigurations = {
          rhodeeBook = self.nixos-flake.lib.mkMacosSystem {
            services.nix-daemon.enable = true;
            nixpkgs.hostPlatform = "aarch64-darwin";
            nixpkgs.config.allowUnfree = true;
            imports = [
              self.nixosModules.common
              self.nixosModules.darwin
              ({ pkgs, ... }: {
                # Used for backwards compatibility, please read the changelog before changing.
                # $ darwin-rebuild changelog
                system.stateVersion = 4;
              })
              # Your home-manager configuration
              self.darwinModules_.home-manager
              {
                home-manager.users.${itsMe} = {
                  imports = [
                    self.homeModules.common
                    self.homeModules.darwin
                  ];
                  home.stateVersion = "22.11";
                  home.username = "${itsMe}";
                  home.homeDirectory = "/Users/${itsMe}";
                };
              }
            ];
          };
        };

        # All nixos/nix-darwin configurations are kept here.
        nixosModules = {
          # Common nixos/nix-darwin configuration shared between Linux and macOS.
          common = { pkgs, ... }: {
          };

          # NixOS Linux specific configuration
          linux = { pkgs, ... }: {
            users.users.${itsMe}.isNormalUser = true;
            services.netdata.enable = true;
          };

          # nix-darwin specific configuration
          darwin = { pkgs, ... }: {
            users.users.${itsMe}.home = "/Users/${itsMe}";
            security.pam.enableSudoTouchIdAuth = true;
          };
        };

        # All home-manager configurations are kept here.
        homeModules = {
          common = { pkgs, ... }: {
            imports = [
              ./nix/home/nix-index.nix
              ./nix/home/fonts.nix
              ./nix/home/tmux
              ./nix/home/fish
              ./nix/home/bat
              ./nix/home/git
              ./nix/home/neovim
              ./nix/home/shell
              ./nix/home/shell/packages.nix
            ];

            home.shellAliases = {
              g = "git";
              lg = "lazygit";
            };
          };

          linux = { pkgs, ... }: {
            imports = [
              ./nix/home/fish
            ];

            gtk = {
              enable = true;
              theme = {
                name = "Catppuccin-Mocha-Pink";
                package = pkgs.catppuccin-gtk.override {
                  accents = [ "pink" ];
                  tweaks = [ "rimless" ];
                  variant = "mocha";
                };
              };
            };

            programs = {
              # on macOS, you probably don't need this
              bash = {
                enable = false;
                initExtra = ''
                  # Make Nix and home-manager installed things available in PATH.
                  export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
                '';
              };
            };

            home.packages = with pkgs; [
              ethtool
              iotop # io monitoring
              less # On ubuntu, we need this less for `man home-configuration.nix`'s pager to work.
              lm_sensors # for `sensors` command
              ltrace # library call monitoring
              strace # system call monitoring
              sysstat
              usbutils # lsusb
              wavemon # Terminal WiFi monitor
            ];
          };

          darwin = { pkgs, ... }: {
            imports = [
              ./nix/home/fish
            ];

            programs = {
              # For macOS's default shell.
              zsh = {
                enable = true;
                autosuggestion.enable = true;
                syntaxHighlighting.enable = true;
                envExtra = ''
                  # Make Nix and home-manager installed things available in PATH.
                  export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
                '';
              };
            };

            home.packages = with pkgs; [
              iterm2
              tart
              terminal-notifier
            ];
          };
        };
      };
  };
}
