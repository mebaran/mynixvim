{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "goose-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "azorng";
        repo = "goose.nvim";
        rev = "main";
        sha256 = "0h1q9nd2kkxvgbm163k5kf52r96r64vqccvdy45jjwa650vblbpk";
      };
      doCheck = false;
    })
  ];
  extraConfigLua = ''
    require('goose').setup()
  '';
}