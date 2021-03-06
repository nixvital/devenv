# This is a development environment for machine learning projects
# based on pytorch. It also provides useful utility libraries such as
# matplotlib.

{ mkShell, python3, magma, cudatoolkit, nccl, cudnn }:

let customMagma =  magma.override {
      inherit cudatoolkit;
    };

    customPython = python3.withPackages (python-packages: with python-packages; let
      customPytorchWithCuda = pytorchWithCuda.override {
        inherit cudatoolkit nccl cudnn;
        magma = customMagma;
      };
      
      torchvisionWithCuda = torchvision.override {
        pytorch = customPytorchWithCuda;
      };
      
      in [
        jupyterlab ipywidgets ipydatawidgets
        numpy pandas
        matplotlib plotly dash tqdm
        opencv4 imageio
        customPytorchWithCuda torchvisionWithCuda
      ]);

    pythonIcon = "f3e2";  # https://fontawesome.com/v5.15/icons/python?style=brands

in mkShell rec {
  name = "ml";

  packages = [
    customPython
  ];
  
  shellHook = ''
    export PS1="$(echo -e '\u${pythonIcon}') {\[$(tput sgr0)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]} (${name}) \\$ \[$(tput sgr0)\]"
  '';
}
