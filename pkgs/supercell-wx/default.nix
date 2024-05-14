{ appimageTools, fetchurl }:

appimageTools.wrapType2 {
  name = "supercell-wx";
  version = "0.4.4";

  src = fetchurl {
    url = "https://github.com/dpaulat/supercell-wx/releases/download/v0.4.4-release/supercell-wx-v0.4.4-x86_64.AppImage"; # Replace with the actual URL
    sha256 = "f51aa45a2582bb49f624cdd6906bb4b445dff702e4fb7838c7159fc4328be7a3";
  };
}
