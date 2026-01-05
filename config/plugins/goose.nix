{
  pkgs,
  aitools,
  ...
}: {
  extraPackages = [
    aitools.goose-cli
  ];
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "goose-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "azorng";
        repo = "goose.nvim";
        rev = "main";
        sha256 = "sha256-QPhPQbrJjXXE3UFtPTGKugavBVQKCLbi2PoQc1HwSds=";
      };
      doCheck = false;
    })
  ];
  extraConfigLua = ''
    require('goose').setup()
  '';
}
