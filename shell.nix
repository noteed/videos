{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = [
      pkgs.doctl
      pkgs.expect
      pkgs.ffmpeg
      pkgs.inkscape
      (pkgs.callPackage ../termtosvg/termtosvg.nix {})
    ];
}

