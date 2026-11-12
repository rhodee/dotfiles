{ ... }:
{
  programs = {
    # For macOS's default shell.
    zsh = {
      enable = true;
      # ~/.zshenv is read by every zsh, including non-interactive ones
      # (e.g. Claude Code's Bash tool), so volta tools resolve there too.
      envExtra = ''
        export VOLTA_HOME="$HOME/.volta"
        export PATH="$VOLTA_HOME/bin:$PATH"
      '';
    };
  };
}
