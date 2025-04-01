{pkgs, ...}: {
  plugins.lsp.enable = true;
  plugins.lsp.servers.gopls.enable = true;
  extraPackages = with pkgs; [
    gomodifytags
    reftools
  ];
}
