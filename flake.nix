{
  description = "Cemuhook DSU server for the Steam Deck Gyroscope";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in rec {
    packages.${system}.sdgyrodsu = pkgs.callPackage ./package.nix { };
    defaultPackage.${system} = packages.${system}.sdgyrodsu;
  };
}
