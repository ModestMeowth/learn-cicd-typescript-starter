{pkgs, ...}:
pkgs.mkShell {
  packages = with pkgs; [
    just
    (writeScriptBin "psql" ''
      ${just}/bin/just psql "$@"
    '')
  ];

  buildInputs = with pkgs; [
    nodejs
  ];
}
