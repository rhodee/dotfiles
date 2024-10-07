# Install Development Environment

## Checklist

- [ ] New install? `curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install`
- [ ] Already installed? `nix config check`

```sh
mkdir $XDG_CONFIG_HOME/nix
cp nix.conf $XDG_CONFIG_HOME/nix/
cp -r nixconfig $XDG_CONFIG_HOME/
```

Then run:

```sh
cd $XDG_CONFIG_HOME/nixconfig
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
darwin-rebuild switch --flake ~/.config/nixconfig
nix run .#activate[-home] # use the optional variant for non nixos linux
```

To update:

```sh
nix run .#update && nix run .#activate[-home] # or nix flake update && nix run .#activate[-home]
```

To update nix:

```sh
nix upgrade-nix --nix-store-paths-url https://install.determinate.systems/nix-upgrade/stable/universal
```

## Troubleshooting

1. On a mac, you may need to download [iterm2](https://iterm2.com/) as the installed version does not appear in the Finder.

1. Some items may fail to appear available in the shell, simply restart the shell or even the device.

1. Nix can't find your machine. Be sure the `username` and `configuration` are correct and rerun.
