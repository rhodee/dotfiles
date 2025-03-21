{ flake, config, lib, pkgs, ... }:
{
  catppuccin.starship.enable = true;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
    settings = {
      scan_timeout = 30;
      command_timeout = 500;

      # A minimal left prompt
      format = "$character";

      right_format = "$cmd_duration$git_branch$git_status$directory";

      # Don't print a new line at the start of the prompt
      add_newline = false;

      git_branch = {
        format = "[$branch(:$remote_branch)]($style)";
        style = "bold purple";
      };

      sudo = {
        symbol = "#";
        format = "[$symbol]($style) ";
        style = "bold red";
        disabled = false;
      };

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
}