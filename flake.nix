{
  description = "Base Nvim Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = { 
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    nixvim,
    flake-parts,
    ...
  } @ inputs: let
    langs = {
      nixlang = import ./lang/nixlang.nix;
      python = import ./lang/python.nix;
      web = import ./lang/web.nix;
      sql = import ./lang/sql.nix;
      golang = import ./lang/golang.nix;
    };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = {
        inherit langs;  
      };

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {
        pkgs,
        system,
        lib,
        ...
      }: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config; # import the module directly
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in rec {
        packages =
          {
            default = nvim.extend langs.nixlang;
            all = lib.foldl (n: l: n.extend l) nvim (lib.attrValues langs);
          }
          // lib.mapAttrs (name: value: nvim.extend value) langs;

        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        devShells = with pkgs;
          lib.mapAttrs (a: v: mkShell {buildInputs = [v];}) packages;
      };
    };
}
