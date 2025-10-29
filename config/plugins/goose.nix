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
        sha256 ="sha256-3Qj3HTrMX2dIPvK6/Z6pILZj7Xr2RZ33NwYCpu50vW4=";
      };
      doCheck = false;
    })
  ];
  extraConfigLua = ''
    require('goose').setup()
  '';
}
