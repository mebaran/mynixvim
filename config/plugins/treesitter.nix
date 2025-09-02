{pkgs, ...}: let
  grammarPkgs = pkgs.vimPlugins.nvim-treesitter.allGrammars;
in {
  plugins.treesitter = {
    enable = true;
    grammarPackages = grammarPkgs; 
    settings = {
      highlight.enable = true;
      indent.enable = true;
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<C-space>";
          node_incremental = "<C-space>";
          scope_incremental = false;
          node_decremental = "<bs>";
        };
      };
    };
  };
  plugins.treesitter-context = {
    enable = true;
    settings = {
      mode = "cursor";
    };
  };
  plugins.treesitter-textobjects.enable = true;
  plugins.ts-autotag.enable = true;

  opts = {
    foldmethod="expr";
    foldexpr = "nvim_treesitter_expr()";
  };
}
