{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "goose-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "azorng";
        repo = "goose.nvim";
        rev = "main";
        sha256 = "1ry5kcx5kyq6kznknggxjwnbzjnsl09asnbxlcvk46qwhvd4s1qr";
      };
      doCheck = false;
    })
  ];
  extraConfigLua = ''
    require('goose').setup()
  '';
}
