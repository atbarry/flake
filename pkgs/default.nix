pkgs: {
  supercell-wx = pkgs.callPackage ./supercell-wx;

  # Scripts
  nix-inspect = pkgs.callPackage ./nix-inspect {};
}
