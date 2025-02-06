# Install Development Environment

- [ ] Already have `nix` installed and need to refresh? See [Troubleshooting Guide](https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#troubleshooting)

## Install Nix

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install --no-confirm --extra-conf "trusted-users = root $(whoami)"
```

## Build Machine

```sh
nix --accept-flake-config run github:juspay/omnix -- init github:juspay/nixos-unified-template -o $HOME/.config/nixconfig
```

Follow prompts then a working config is generated at `$HOME/.config/nixconfig`.

If you cloned this repo you can run `nix run` on macOS or `nix run . <your user>` on a non nixOS (YMMV).

Before you do that...Make sure to have the configs like this:

```sh
cp nix.conf $XDG_CONFIG_HOME/nix/nix.conf
cp nixconfig $XDG_CONFIG_HOME/nixconfig
cd $XDG_CONFIG_HOME/nixconfig
```

To update nix -> <https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#upgrading-nix>

To update your flakes:

```sh
nix flake update && nix run [. $USER@ ] # add the ' .$USER@' on non-NixOS Linux
```

## Troubleshooting

### Rebuild System

On a really, really bad system failure I ran these commands to get it working again.

```sh
nix --extra-experimental-features "nix-command flakes" run nix-darwin#darwin-uninstaller
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- uninstall

sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.before-nix-darwin
sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin
sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin

rm $HOME/.local/state/nix/profiles/home-manager*
rm $HOME/.local/state/home-manager/gcroots/current-home
```
