{
  description = "Flake for sunsetr";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
  outputs =
    { self, nixpkgs }:
    let
      ver = "0.7.1";
    in
    {
      packages.x86_64-linux.sunsetr = nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation {
        pname = "sunsetr";
        version = "${ver}";
        src = nixpkgs.legacyPackages.x86_64-linux.fetchurl {
          url = "https://github.com/psi4j/sunsetr/releases/download/v${ver}/sunsetr-v${ver}-x86_64-linux.tar.gz";
          sha256 = "0wxrs25z7sg56fh9759b3f70wr3ph2452rd1hbdf7lmqgdmd5s4q";
        };
        phases = [
          "unpackPhase"
          "installPhase"
        ];
        unpackPhase = ''
          tar xvf $src
        '';
        installPhase = ''
          mkdir -p $out/bin
          cp sunsetr-v${ver}/sunsetr $out/bin/
        '';
        meta = {
          description = "Automatic blue light filter for Hyprland, Niri, and everything Wayland";
          homepage = "https://github.com/psi4j/sunsetr";
          license = nixpkgs.legacyPackages.x86_64-linux.lib.licenses.mit;
          platforms = [ "x86_64-linux" ];
        };
      };
      packages.x86_64-linux.default = self.packages.x86_64-linux.sunsetr;
    };
}
