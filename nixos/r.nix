# /etc/nixos/r.nix
{ pkgs, ... }:
with pkgs;
let
  my-r-packages = with rPackages; [
    tidyverse
    base64enc
    digest
    evaluate
    glue
    highr
    htmltools
    jsonlite
    knitr
    magrittr
    markdown
    mime
    rmarkdown
    stringi
    stringr
    xfun
    yaml
    dplyr
    profvis
    htmlwidgets
    lobstr
  ];
  R-with-my-packages = pkgs.rWrapper.override{
    packages = my-r-packages;
  };
  RStudio-with-my-packages = rstudioWrapper.override{
    packages = my-r-packages;
  };
in {
  environment.systemPackages = with pkgs; [
    R-with-my-packages
    RStudio-with-my-packages
  ];
}

