{ lib, fetchFromGitHub, buildDunePackage, alcotest, fmt, gnuplot }:

buildDunePackage rec {
  pname = "metrics";
  version = "0.4.0";

  useDune2 = true;

  minimumOCamlVersion = "4.04";

  src = fetchFromGitHub {
    owner = "mirage";
    repo = "metrics";
    rev = "v${version}";
    sha256 = "sha256-v+A2u/sEv6JC+n8nGAkgBdMC7pNSP/s2jZqvZ3dykPM=";
  };

  propagatedBuildInputs = [ fmt ];

  checkInputs = [ alcotest ];

  doCheck = true;

  meta = {
    description = "Metrics infrastructure for OCaml";
    homepage = "https://github.com/mirage/metrics";
    license = lib.licenses.isc;
    maintainers = [ lib.maintainers.vbgl ];
  };

}
