# This is a very basic python development environment, with jupyter
# lab installed.

{ pkgs,
  mkShell,
  pythonVersion ? "310"
}:

let customizedPython = pkgs."python${pythonVersion}".withPackages (python-packages: with python-packages; [
      jupyterlab numpy matplotlib
    ]);

    pythonIcon = "f3e2";  # https://fontawesome.com/v5.15/icons/python?style=brands

in mkShell rec {
  name = "py-vanilla";

  packages = [
    customizedPython
  ];
  
  shellHook = ''
    export PS1="$(echo -e '\u${pythonIcon}') {\[$(tput sgr0)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]} (${name}) \\$ \[$(tput sgr0)\]"
  '';
}
