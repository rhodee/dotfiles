{
  description = "A home-manager template providing useful tools & settings for Nix-based development";

  inputs = {
    # Principle inputs (updated by `nix run .#update`)
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz";
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
            ];

            home.shellAliases = {
              g = "git";
              lg = "lazygit";
            };

            programs = {
              # Type `<ctrl> + r` to fuzzy search your shell history
              jq.enable = true;

              direnv = {
                enable = true;
                nix-direnv.enable = true;
              };

              fzf = {
                enable = true;
                enableFishIntegration = true;
                defaultCommand = "rg --files --hidden --follow";
              };

              starship = {
                enable = true;
                enableFishIntegration = true;
                enableTransience = true;
                settings = {
                  scan_timeout = 30;
                  command_timeout = 500;

                  # A minimal left prompt
                  format = "$character";

                  # move the rest of the prompt to the right
                  right_format = "$all";


                  # Don't print a new line at the start of the prompt
                  add_newline = false;

                  character = {
                    success_symbol = "[➜](bold green) ";
                    error_symbol = "[✗](bold red) ";
                  };

                  directory = {
                    truncation_length = 4;
                    repo_root_style = "bold #efeeee";
                  };

                  package = {
                    disabled = true;
                  };

                  cmd_duration = {
                    min_time = 10000;
                    format = "⏱ $duration ";
                    style = "yellow";
                  };

                  battery = {
                    display = [
                      { threshold = 20; style = "bold red"; discharging_symbol = "💀"; }
                      { threshold = 50; style = "bold yellow"; }
                    ];
                  };

                  memory_usage = {
                    symbol = " ";
                    disabled = false;
                    threshold = 80;
                  };

                  username = {
                    style_user = "blue bold";
                    style_root = "red bold";
                    format = "[$user]($style) ";
                    disabled = false;
                    show_always = true;
                  };

                  hostname = {
                    ssh_only = false;
                    ssh_symbol = "🌐 ";
                    format = "on [$hostname](bold red) ";
                    trim_at = ".local";
                    disabled = false;
                  };
                };
              };

              # Type `z <pat>` to cd to some directory
              zoxide = {
                enable = true;
                enableFishIntegration = true;
              };

              atuin = {
                enable = true;
                enableFishIntegration = true;
              };

              eza = {
                enable = true;
                enableFishIntegration = true;
              };
            };

            home.packages = with pkgs; [
              age
              bottom
              fd
              ripgrep
              tmux
              tree
              gnupg

              # fetch
              wget
              openssh
              curl

              # archives
              zip
              xz
              unzip
              p7zip

              # nix related
              #
              # it provides the command `nom` works just like `nix`
              # with more details log output
              nix-output-monitor

              # productivity
              glow # markdown previewer in terminal

              btop # replacement of htop/nmon
              iftop # network monitoring

              # system call monitoring
              lsof # list open files

              # system tools
              pciutils # lspci

              # node tooling
              pkgs.nodePackages.nodejs
              pkgs.nodePackages.neovim
              # template tool
              (pkgs.python3.withPackages (python-pkgs: [ python-pkgs.pip python-pkgs.cookiecutter ]))
            ];
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
                enableBashIntegration = true;
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
