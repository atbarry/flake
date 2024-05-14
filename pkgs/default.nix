{pkgs ? import <nixpkgs> {}, ...}: {
  supercell-wx = pkgs.callPackage ./supercell-wx;
}
