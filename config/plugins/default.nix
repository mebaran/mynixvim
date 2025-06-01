{pkgs ? import <nixpkgs>, ...}:
{
  imports = [
    ./autocomplete.nix
    ./codecompanion.nix
    ./conform.nix
    ./flash.nix
    ./gitsigns.nix
    ./goose.nix
    ./lsp.nix
    ./lualine.nix
    ./mini.nix
    ./treesitter.nix
    ./trouble.nix
    ./yanky.nix
  ];
  
  plugins = {
    diffview.enable = true;
    fidget.enable = true;
    git-conflict.enable = true;
    lazygit.enable = true;
    nvim-bqf.enable = true;
    render-markdown.enable = true;
    sqlite-lua.enable = true;
    ts-comments.enable = true;
    zen-mode.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    nvim-unception
  ];
}
