{ buildDunePackage, carton
, lwt, decompress, optint, bigstringaf
, alcotest, alcotest-lwt, cstruct, fmt, logs
, mirage-flow, result, rresult
, ke, base64, bos, checkseum, digestif, fpath
, stdlib-shims
, git-binary # pkgs.git
}:

buildDunePackage {
  pname = "carton-lwt";

  inherit (carton) version src postPatch;
  duneVersion = "3";

  propagatedBuildInputs = [
    carton
    lwt
    decompress
    optint
    bigstringaf
  ];

  # broken by upstream duff release mutation
  doCheck = false;
  nativeCheckInputs = [
    git-binary
  ];
  checkInputs = [
    alcotest
    alcotest-lwt
    cstruct
    fmt
    logs
    mirage-flow
    result
    rresult
    ke
    base64
    bos
    checkseum
    digestif
    fpath
    stdlib-shims
  ];

  inherit (carton) meta;
}
