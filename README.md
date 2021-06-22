# devenv
A collection of development environment for different projects.

This project aims to 

1. Help you quickly spin up a development environment for hacking (as `devShells`).
2. Provides skeleton for your next project's development environment.

## How to Use?

All the development environments are wrapped in the
[flake.nix](flake.nix). This means that to activate one of the
`devShells` (e.g. [py-vanilla](envs/py-vanilla/default.nix)), you just
need to run

```bash
$ nix develop "github:nixvital/devenv#py-vanilla"
```

## List of Provided Development Environment

1. [py-vanilla](envs/py-vanilla/default.nix): This is a very basic
   python development environment, with jupyter installed.
   

