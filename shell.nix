/* with import <nixpkgs> {}; */
/* { */
/*   myProject = stdenv.mkDerivation { */
/*     name = "myProject"; */
/*     version = "1"; */
/*     src = if lib.inNixShell then null else nix; */

/*     buildInputs = let */
/*         rpacs = with rPackages; [ */
/*           R */
/*           ggplot2 */
/*           knitr */
/*           bookdown */
/*         ]; */
/*         pandoc = with nixpkgs; [ */
/*             pandoc */
/*         ]; */
/*     in */
/*         rpacs ++ pandoc; */
/*   }; */
/* } */

{ pkgs ? import <nixpkgs> {} }:
    pkgs.mkShell
      { buildInputs = with pkgs; [
            pandoc
            R
            rPackages.ggplot2
            rPackages.knitr
            rPackages.bookdown
        ];
      }
