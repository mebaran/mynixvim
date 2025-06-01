{pkgs ? import <nixpkgs>, ...}: {
  # Import all your configuration modules here
  imports = [./editor.nix ./keymaps.nix ./plugins];

  colorschemes.melange.enable = true;

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
}
