{ lib
, buildDunePackage
, tezos-stdlib
, tezos-protocol-010-PtGRANAD
, tezos-protocol-updater
, tezos-protocol-environment
, ocp-ocamlres
, pprint
}:

buildDunePackage {
  pname = "tezos-embedded-protocol-010-PtGRANAD";
  inherit (tezos-stdlib) version useDune2;
  src = "${tezos-stdlib.base_src}/src";

  nativeBuildInputs = [ tezos-protocol-updater ];

  buildInputs = [
    tezos-protocol-environment
    tezos-protocol-updater
    ocp-ocamlres
    pprint
  ];

  propagatedBuildInputs = [
    tezos-protocol-010-PtGRANAD
  ];

  doCheck = true;

  meta = tezos-stdlib.meta // {
    description = "Tezos/Protocol: economic-protocol definition, embedded in `tezos-node`";
  };
}
