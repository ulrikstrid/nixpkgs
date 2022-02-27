{ lib
, buildDunePackage
, tezos-stdlib
, tezos-base
, tezos-protocol-alpha
, tezos-protocol-environment
, tezos-protocol-environment-sigs
}:

buildDunePackage {
  pname = "tezos-protocol-plugin-alpha";
  inherit (tezos-stdlib) version useDune2;
  src = "${tezos-stdlib.base_src}/src";

  propagatedBuildInputs = [
    tezos-base
    tezos-protocol-alpha
    tezos-protocol-environment
    tezos-protocol-environment-sigs
  ];

  doCheck = true;

  meta = tezos-stdlib.meta // {
    description = "Tezos/Protocol: protocol plugin";
  };
}
