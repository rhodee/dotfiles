# This is your nix-darwin configuration.
# For home configuration, see /modules/home/*
{ flake, pkgs, lib, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  # Configure macOS system
  # More rhodeeBooks => https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/rich-demo/modules/system.nix
  system = {
    defaults = {
      dock = {
        # autohide = true;
        # customize Hot Corners
        wvous-tl-corner = 2; # top-left - Mission Control
        # wvous-tr-corner = 13; # top-right - Lock Screen
        wvous-bl-corner = 3; # bottom-left - Application Windows
        wvous-br-corner = 4; # bottom-right - Desktop
      };

      finder = {
        _FXShowPosixPathInTitle = true; # show full path in finder title
        AppleShowAllExtensions = true; # show all file extensions
        FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
      };
    };

    keyboard = {
      # enableKeyMapping = true;
      # remapCapsLockToControl = true;
    };
  };
}
