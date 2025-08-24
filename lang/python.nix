{pkgs, ...}: {
  # DAP support
  imports = [./dap.nix];
  inherit (import ./dap.nix) keymaps;
 
  # Lsp config with ty and ruff
  plugins = {
    lsp.enable = true;
    lsp.servers.ruff.enable = true;
    conform-nvim.settings.formatters_by_ft.python = [
      "autopep8"
      "black"
      "isort"
    ];
    dap-python.enable = true;
  };
  extraPackages = with pkgs.python3Packages; [
    autopep8
    black
    isort
  ] ++ [
    pkgs.ty
  ];
  extraConfigLua = ''
    vim.lsp.enable('ty')
  '';
}
