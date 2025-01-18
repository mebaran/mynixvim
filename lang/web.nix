{pkgs, ...}: {
  plugins = {
    lsp.enable = true;
    lsp.servers = {
      emmet_language_server.enable = true;
      ts_ls.enable = true;
    };
    conform-nvim.settings.formatters_by_ft = {
      css = ["prettierd"];
      html = ["pretterd"];
      javascript = ["prettierd"];
    };
  };
  extraPackages = with pkgs; [
    prettierd
    nodejs
    typescript
    nodePackages.npm
  ];
}
