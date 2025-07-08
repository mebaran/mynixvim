{pkgs ? import <nixpkgs>, ...}: {
  # Import all your configuration modules here
  imports = [./editor.nix ./keymaps.nix ./plugins];

  colorschemes.dracula-nvim.enable = true;

  extraPackages = with pkgs; [
    fd
    fzf
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
  };

  vimAlias = true;
}
