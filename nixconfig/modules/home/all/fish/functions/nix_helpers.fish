function nixpurge --description 'purge the nix store'
  nix-store --gc
  nix-collect-garbage -d
end

function nixfix --description 'repair the nix store'
  nix-store --verify --check-contents --repair
end