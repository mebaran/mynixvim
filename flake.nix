{
  description = "My Nixvim Configuration";

  nixConfig = {
    extra-substituters = ["https://numtide.cachix.org"];
    extra-trusted-public-keys = ["numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    nix-ai-tools = {
      url = "github:numtide/llm-agents.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
        nixConfig = {
          extra-substituters = ["https://numtide.cachix.org"];
          extra-trusted-public-keys = ["numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="];
        };
      };

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem = {
        system,
        lib,
        ...
      }: let
        pkgs = import inputs.nixpkgs {
          inherit system;
        };
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs = {
            aitools = inputs.nix-ai-tools.packages.${system};
          };
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in rec {
        packages = let
          baseNvim = nvim.extend langs.nixlang;
        in
          {
            default = baseNvim;
            all = lib.foldl (n: l: n.extend l) nvim (lib.attrValues langs);
          }
          // lib.mapAttrs (name: value: baseNvim.extend value) langs;

        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        devShells = with pkgs;
          lib.mapAttrs (a: v: mkShell {buildInputs = [v];}) packages;
      };
    };
}
