{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [./colorscheme.nix ./editor.nix ./keymaps.nix ./plugins];

  extraPackages = with pkgs; [
    fd
    git
    lazygit
    ripgrep
  ];

  performance = {
    byteCompileLua = {
      enable = true;
      configs = true;
      initLua = true;
      nvimRuntime = true;
      plugins = true;
    };
    combinePlugins = {
      enable = true;
      pathsToLink = [ "/template" ];
      standalonePlugins = [
        "friendly-snippets"
        "blink.cmp"
      ];
    };
  };

  vimAlias = true;
}
