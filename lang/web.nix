{
  pkgs,
  lib,
  ...
}: {
  plugins = {
    lsp.enable = true;
    lsp.servers = {
      emmet_language_server.enable = true;
      ts_ls.enable = true;
    };
    conform-nvim.settings.formatters_by_ft = lib.genAttrs [
      "css"
      "html"
      "javascript"
      "typescript"
    ] (ft: ["biome"]);
  };
  extraPackages = with pkgs; [
    bun
    biome
  ];
}
