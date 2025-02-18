{
  description = "Command line utility for concatenating MP3 files";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";

    mp3cat_src.url = "github:dmulholl/mp3cat";
    mp3cat_src.flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, mp3cat_src }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.buildGoModule {
          pname = "mp3cat";
          version = "4.3.0";

          src = mp3cat_src;

          vendorHash = "sha256-4ziWhpgWz9LmrvyVHc5oaATG5bjdCeKun0tzbaj3oYo=";
        };
      }
    );
}
