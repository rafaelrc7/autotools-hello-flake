{
  description = "Nix Flake C Autotools project template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let pkgs = import nixpkgs { inherit system; };
        deps = [ ];
        hello = with pkgs; stdenv.mkDerivation rec {
          name = "hello";
          src = ./.;
          buildInputs = [ ];
          nativeBuildInputs = deps ++ [ pkg-config autoconf-archive autoreconfHook ];
        };
    in {

      defaultPackage = hello;

      devShell = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          autoconf
          autoconf-archive
          automake
          bash
          binutils
          gcc
          gdb
          gnumake
          pkg-config
          valgrind
        ] ++ deps;
      };
    }
  );

}

