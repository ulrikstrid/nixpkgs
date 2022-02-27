{ lib
, ocaml
, buildDunePackage
, tezos-stdlib
, tezos-protocol-compiler
, tezos-shell-context
, lwt-exit
, ocp-ocamlres
, pprint
}:

buildDunePackage {
  pname = "tezos-protocol-updater";
  inherit (tezos-stdlib) version useDune2;
  src = "${tezos-stdlib.base_src}/src/lib_protocol_updater";

  nativeBuildInputs = [
    ocp-ocamlres
  ];

  buildInputs = [
    ocp-ocamlres
    pprint
  ];

  propagatedBuildInputs = [
    tezos-shell-context
    lwt-exit
    tezos-protocol-compiler
  ];

  doCheck = true;

  meta = tezos-stdlib.meta // {
    description = "Tezos: economic-protocol dynamic loading for `tezos-node`";
  };
}
