{ pkgs, ... }:

{
  home.packages = with pkgs; [
    age
    atuin
    bottom
    eza
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

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
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

  # Programs natively supported by home-manager.
  programs = {
	direnv = {
	  enable = true;
      nix-direnv.enable = true;
	};

    fzf = {
      enable = true;
      enableFishIntegration = true;
      defaultCommand = "rg --files --hidden --follow";
    };

    jq.enable = true;

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
            format = "⏱  $duration ";
            style = "yellow";
        };

        battery = {
          display = [
            { threshold = 20; style  = "bold red"; discharging_symbol = "💀"; }
            { threshold = 50; style = "bold yellow"; }
          ];
        };

        memory_usage = {
          symbol = " ";
          disabled = false;
          threshold = 80;
        };
      };
  	};

  	zoxide = {
      enable = true;
      enableFishIntegration = true;
  	};
  };
}
