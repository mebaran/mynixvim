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
        sha256 ="sha256-swrmTCX6punI3VMOp8kXXd1cSfIRhf5hX/E6sq6bfi8=";
      };
      doCheck = false;
    })
  ];
  extraConfigLua = ''
    require('goose').setup()
  '';
}
