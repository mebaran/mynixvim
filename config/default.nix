{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [./colorscheme.nix ./editor.nix ./keymaps.nix ./plugins];

  extraPackages = with pkgs; [
    fd
    git
    lazygit
    ripgrep
    goose-cli
  ];

  performance = {
    byteCompileLua = {
      enable = true;
      configs = true;
      initLua = true;
      nvimRuntime = true;
      plugins = true;
    };
    combinePlugins.enable = true;
    combinePlugins.standalonePlugins = [
      "mini.nvim"
      "blink.cmp"
    ];
  };

  vimAlias = true;
}
