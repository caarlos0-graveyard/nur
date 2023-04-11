# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  clone-org = pkgs.callPackage ./pkgs/clone-org { };
  discord-applemusic-rich-presence =
    pkgs.callPackage ./pkgs/discord-applemusic-rich-presence { };
  fork-cleaner = pkgs.callPackage ./pkgs/fork-cleaner { };
  jsonfmt = pkgs.callPackage ./pkgs/jsonfmt { };
  svu = pkgs.callPackage ./pkgs/svu { };
  goreleaser-pro = pkgs.callPackage ./pkgs/goreleaser-pro { };

  # some-qt5-package = pkgs.libsForQt5.callPackage ./pkgs/some-qt5-package { };
  # ...
}
