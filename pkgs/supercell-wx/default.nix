{ stdenv, fetchurl, makeWrapper }:

stdenv.mkDerivation {
  pname = "supercell-wx";
  version = "0.4.4";

  src = fetchurl {
    url = "https://github.com/dpaulat/supercell-wx/releases/download/v0.4.4-release/supercell-wx-v0.4.4-x86_64.AppImage"; # Replace with the actual URL
    sha256 = "f51aa45a2582bb49f624cdd6906bb4b445dff702e4fb7838c7159fc4328be7a3";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/supercell-wx.AppImage
    chmod +x $out/bin/supercell-wx.AppImage
    wrapProgram $out/bin/supercell-wx.AppImage --prefix PATH : $out/bin
    '';
}
