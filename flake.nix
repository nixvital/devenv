{
  description = "A collection of development environment for different projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/21.05";

    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@input: input.flake-utils.lib.eachSystem [
    "x86_64-linux" "i686-linux" "aarch64-linux" "x86_64-darwin"
  ] (system:
    let pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
    in {
      packages = {
        py-vanilla = pkgs.callPackage ./envs/py-vanilla {};
      };
    });
}