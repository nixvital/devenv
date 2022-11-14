{
  description = "A collection of development environment for different projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

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
        py-vanilla311 = pkgs.callPackage ./envs/py-vanilla {
          pythonVersion = "311";
        };        
        ml-basic = pkgs.callPackage ./envs/ml-basic {};
        ml-pytorch = pkgs.callPackage ./envs/ml-pytorch {
          cudatoolkit = pkgs.cudatoolkit_11_2;
          nccl = pkgs.nccl_cudatoolkit_11;
          cudnn = pkgs.cudnn_cudatoolkit_11_2;
        };
      };
    });
}
