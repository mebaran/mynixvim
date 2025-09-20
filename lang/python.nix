{pkgs, ...}: {
  # DAP support
  imports = [./dap.nix];
  plugins.dap-python.enable = true;
  inherit (import ./dap.nix) keymaps;

  # LSP config with ty and ruff
  plugins = {
    lsp = {
      enable = true;
      servers.basedpyright.enable = true;
      servers.ruff.enable = true;
    };
    conform-nvim.settings.formatters_by_ft.python = ["isort"];
  };
  extraPackages = with pkgs; [
    isort
  ];
}
