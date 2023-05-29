# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{ system ? builtins.currentSystem, pkgs, lib, fetchurl, installShellFiles }:
let
  shaMap = {
    x86_64-linux = "0rc4f3r6g314j2bs6zzjaxd8pv00wwkrmndsrz2v804nq4s3cl5i";
    x86_64-darwin = "0gk8v9i59hv3dwfns5ff0h0i93w0bnbf2nv077p4094kfvvwf8vx";
  };

  urlMap = {
    x86_64-linux = "https://github.com/caarlos0-graveyard/test/releases/download/v1.0.7/foo_1.0.7_linux_amd64.tar.gz";
    x86_64-darwin = "https://github.com/caarlos0-graveyard/test/releases/download/v1.0.7/foo_1.0.7_darwin_amd64.tar.gz";
  };
in pkgs.stdenv.mkDerivation {
  pname = "test";
  version = "1.0.7";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./moises $out/bin/moises
  '';

  system = system;

  meta = with lib; {
    description = "a test";
    homepage = "https://test";
    license = licenses.mit;

    platforms = [
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
