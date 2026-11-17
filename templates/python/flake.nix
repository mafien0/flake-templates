{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        uv
        just
        python3
      ];

      LD_LIBRARY_PATH = with pkgs;
        lib.makeLibraryPath [
          stdenv.cc.cc.lib
        ];
    };
  };
}
