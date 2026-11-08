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

## Set fish as the default shell

Home Manager cannot change the login shell. nix-darwin has to register fish and set it for the user. In `modules/darwin/default.nix`:

```nix
programs.fish.enable = true;                 # adds fish to /etc/shells
environment.shells = [ pkgs.fish ];
users.users."<user>".shell = pkgs.fish;

# Without this, activation fails if ~/.zshrc (or any managed file) already exists
home-manager.backupFileExtension = "hm-backup";
```

Rebuild with `nix run`, then check the login shell:

```sh
dscl . -read /Users/$USER UserShell
```

macOS can ignore the nix-darwin setting for an existing user. If it still shows `/bin/zsh`, run this once and open a new terminal:

```sh
chsh -s /run/current-system/sw/bin/fish
```

## Troubleshooting

### Activation fails with "Existing file ... would be clobbered"

Home Manager will not overwrite a regular file it wants to manage, such as `~/.zshrc` (from `programs.zsh.enable`). Set `home-manager.backupFileExtension` (see above) so the old file is renamed to `<file>.hm-backup`, then rerun `nix run`. Check the backup for anything you still need.

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

## GPG commit signing

1. Generate the key (RSA 4096, 2y, name `rhodee`, email `info@rhodee.us`):

   ```sh
   gpg --full-generate-key
   ```

2. Note the long key ID from the `sec` line:

   ```sh
   gpg --list-secret-keys --keyid-format=long
   ```

3. Create a revocation certificate and a secret key backup. Move both offline, then delete the local copies:

   ```sh
   gpg --gen-revoke <KEY_ID> > revoker-<KEY_ID>.asc
   gpg --export-secret-keys --armor <KEY_ID> > key.asc
   ```

4. Add the public key to GitHub (Settings > SSH and GPG keys > New GPG key):

   ```sh
   gpg --armor --export <KEY_ID> | pbcopy
   ```

5. Test signing:

   ```sh
   echo test | gpg --clearsign
   ```
