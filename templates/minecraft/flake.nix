{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Flake-utils
    systems.url = "github:nix-systems/default";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.system.follows = "systems";
    };
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        java = pkgs.temurin-bin-25;
      in {
        devShells.${system}.default = pkgs.mkShell {
          packages = with pkgs; [
            java
            gradle
          ];

          JAVA_HOME = "${java}";
        };
      }
    );
}
