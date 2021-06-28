# This equips with the basic packages for machine learning and data
# science, for example pandas and lightgbm.

{ mkShell, python3, ... }:

let customizedPython = python3.withPackages (python-packages: with python-packages; [
      jupyterlab ipywidgets ipydatawidgets numpy matplotlib
      pandas lightgbm plotly
    ]);

    pythonIcon = "f3e2";  # https://fontawesome.com/v5.15/icons/python?style=brands

in mkShell rec {
  name = "ml-basic";

  packages = [
    customizedPython
  ];
  
  shellHook = ''
    export PS1="$(echo -e '\u${pythonIcon}') {\[$(tput sgr0)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]} (${name}) \\$ \[$(tput sgr0)\]"
  '';
}
