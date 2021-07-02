{ lib, stdenv, fetchFromGitHub, make, obs-studio }:

stdenv.mkDerivation rec {
  pname = "obs-droidcam";
  version = "1.2.1";

  buildInputs = [ obs-studio ];

  nativeBuildInputs = [ make ];

  src = fetchFromGitHub {
    owner = "dev47apps";
    repo = "droidcam-obs-plugin";
    rev = version;
    sha256 = "05d6ly1q7kyvj1v37jqg31q1vlq3fkgk2zlm3cbbdnzf02m4ncww";
  };

  meta = with lib; {
    description = "connect your phone and get high quality audio & video just like a regular camera source";
    homepage = "https://www.dev47apps.com/obs/";
    maintainers = with maintainers; [ ulrikstrid ];
    license = licenses.gpl2;
    platforms = with platforms; linux;
  };
}
