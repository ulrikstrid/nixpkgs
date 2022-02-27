{ lib
, buildDunePackage
, tezos-stdlib
, tezos-protocol-demo-noops
, tezos-protocol-updater
, tezos-protocol-environment
, ocp-ocamlres
, pprint
}:

buildDunePackage {
  pname = "tezos-embedded-protocol-demo-noops";
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
    tezos-protocol-demo-noops
  ];

  doCheck = true;

  meta = tezos-stdlib.meta // {
    description = "Tezos/Protocol: demo_noops (economic-protocol definition, embedded in `tezos-node`)";
  };
}
