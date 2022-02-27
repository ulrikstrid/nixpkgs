{ lib
, buildDunePackage
, tezos-stdlib
, tezos-protocol-compiler
, tezos-protocol-environment
, tezos-protocol-environment-sigs
}:

buildDunePackage {
  pname = "tezos-protocol-alpha";
  inherit (tezos-stdlib) version useDune2;
  src = "${tezos-stdlib.base_src}/src";

  nativeBuildInputs = [
    tezos-protocol-compiler
  ];

  buildInputs = [
    tezos-protocol-environment
    tezos-protocol-environment-sigs
  ];

  doCheck = true;

  meta = tezos-stdlib.meta // {
    description = "Tezos/Protocol: economic-protocol definition";
  };
}
