# Start
```sh

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
mkdir $XDG_HOME/nix
cp nix.conf $HOME/.config/nix/
cp -r nixconfig $HOME/.config/
cd $HOME/.config/nixconfig
nix run
```
