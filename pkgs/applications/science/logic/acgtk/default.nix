{ lib, stdenv, fetchurl, ocamlPackages }:

ocamlPackages.buildDunePackage {
  pname = "acgtk";
  version = "1.5.2";

  src = fetchurl {
    url = "https://acg.loria.fr/software/acg-1.5.2-20201204.tar.gz";
    sha256 = "09yax7dyw8kgwzlb69r9d20y7rrymzwi3bbq2dh0qdq01vjz2xwq";
  };

  useDune2 = true;

  nativeBuildInputs = with ocamlPackages; [ menhir ];

  buildInputs = (with ocamlPackages; [
    ansiterminal cairo2 cmdliner fmt logs menhirLib mtime yojson
  ]);

  buildPhase = ''
    runHook preBuild
    dune build --release ''${enableParallelBuilding:+-j $NIX_BUILD_CORES}
    runHook postBuild
  '';

  meta = with lib; {
    homepage = "https://acg.loria.fr/";
    description = "A toolkit for developing ACG signatures and lexicon";
    license = licenses.cecill20;
    inherit (ocamlPackages.ocaml.meta) platforms;
    maintainers = [ maintainers.jirkamarsik ];
  };
}
