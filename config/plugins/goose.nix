{pkgs, ...}: {
  extraPackages = [
    pkgs.goose-cli
  ];
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "goose-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "azorng";
        repo = "goose.nvim";
        rev = "main";
        sha256 = "sha256-54hLyfceOURA+yKB/nyeuhlYooFi6GEsq03Tt7g78wU=";
      };
      doCheck = false;
    })
  ];
  extraConfigLua = ''
    require('goose').setup()
  '';
}
