{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "goose-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "azorng";
        repo = "goose.nvim";
        rev = "main";
        sha256 = "13m2x9qyi0q1l6dpkwl7idfzyydn8lgj877kj2j6ghnnpmlhyq6h";
      };
      doCheck = false;
    })
  ];
  extraConfigLua = ''
    require('goose').setup()
  '';
}