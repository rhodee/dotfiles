{ flake, config, lib, pkgs, ... }:
{
  programs.ripgrep = {
    enable = true;
    arguments = [
      # Search case-insensitively if pattern is all lowercase.
      # Use --case-sensitive or -s to override.
      "--smart-case"
      "--max-columns=150"
      "--max-columns-preview"
      # Search hidden files without (hopefully) bringing
      # in .gitignore file refs
      # https://github.com/BurntSushi/ripgrep/issues/1303
      "--hidden"
      # ''--glob="!**/.git/**"''
      "--color=always"
      "--line-number"
      "--no-heading"
    ];
  };
}
