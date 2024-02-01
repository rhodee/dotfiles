# Start
```sh

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
mkdir $XDG_HOME/nix
cp nix.conf $HOME/.config/nix/
cp -r nixconfig $HOME/.config/
```

To use this configuration, you **must** change the username (`itsme`) in `$HOME/.config/nixconfig/flake.nix`

Then run:

```sh
cd $HOME/.config/nixconfig
nix run
```
