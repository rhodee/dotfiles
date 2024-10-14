# Install Development Environment

- [ ] Already installed? See [Rebuild Existing System](#rebuild-system)

## Install Nix

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install --no-confirm --extra-conf "trusted-users = root $(whoami)"
```

## Build Machine

It is probably best to run this command:

```sh
nix --accept-flake-config run github:juspay/omnix -- init github:juspay/nixos-unified-template -o $HOME/.config/nixconfig
```

Answer the prompts and then you will have a working config. To make it more useful (to myself) copy the `modules`
directory and wire it up in each configuration.

If you are just moving configs between machines follow the steps below:

```sh
cp nix.conf $HOME/nix/nix.conf
cp nixconfig $HOME/.config/nixconfig
cd $HOME/.config/nixconfig

# One-time activation
nix --extra-experimental-features "nix-command flakes" run
```

To update:

```sh
nix flake update && nix run [. $USER@ ] # add the ' .$USER@' on non-NixOS Linux
```

To update nix:

```sh
nix upgrade-nix --nix-store-paths-url https://install.determinate.systems/nix-upgrade/stable/universal
```

## Rebuild System

```sh
nix --extra-experimental-features "nix-command flakes" run nix-darwin#darwin-uninstaller
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- uninstall

sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.before-nix-darwin
sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin
sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin

rm $HOME/.local/state/nix/profiles/home-manager*
rm $HOME/.local/state/home-manager/gcroots/current-home
```
