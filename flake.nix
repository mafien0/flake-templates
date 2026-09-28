{
  description = "mafien0 custom flake templates";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs: {
    templates = {
      minecraft = {
        path = ./templates/minecraft;
        description = "Basic flake for minecraft modern modding";
      };

      rust = {
        path = ./templates/rust;
        description = "Basic flake for working with rust";
      };

      go = {
        path = ./templates/go;
        description = "Basic flake for working with go";
      };
    };
  };
}
