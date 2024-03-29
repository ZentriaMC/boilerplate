{
  description = "Zentria repository boilerplate";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    clean-devshell.url = "github:ZentriaMC/clean-devshell";
  };

  outputs = { self, nixpkgs, flake-utils, clean-devshell, ... }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
    in
    flake-utils.lib.eachSystem supportedSystems (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        mkShell = pkgs.callPackage clean-devshell.lib.mkDevShell { };
      in
      rec {
        devShell = mkShell {
          packages = [

          ];
        };
      });
}
