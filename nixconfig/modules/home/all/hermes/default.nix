{ config, lib, ... }:
{
  home.file."${config.xdg.configHome}/hermes/config.yaml" = {
    source = ./config.yaml;
    recursive = false;
  };

  # Hermes rewrites $HERMES_HOME/config.yaml at runtime (`hermes config set`, model
  # switches, `hermes mcp add`) via temp-file + rename onto the resolved path, so the
  # live file cannot be the read-only store symlink above — seed a writable copy instead.
  home.activation.hermesConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run mkdir -p "$HOME/.hermes"
    if [ ! -e "$HOME/.hermes/config.yaml" ]; then
      run install -m 600 \
        "${config.xdg.configHome}/hermes/config.yaml" "$HOME/.hermes/config.yaml"
    fi
  '';
}
