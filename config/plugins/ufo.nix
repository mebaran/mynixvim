{
  options = {
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
  };
  plugins.nvim-ufo = {
    enable = true;
    setupLspCapabilities = false;
    settings = {
      provider_selector.__raw = ''
        function(bufnr, filetype, buftype)
          return {"treesitter", "indent"}
        end
      '';
    };
  };
  keymaps = [
    {
      key = "zR";
      action.__raw = "require('ufo').openAllFolds()";
      mode = "n";
      options.desc = "Open all folds";
    }
    {
      key = "zM";
      action.__raw = "require('ufo').closeAllFolds()";
      mode = "n";
      options.desc = "Close all folds";
    }
    {
      key = "zr";
      action.__raw = "require('ufo').openFoldsExceptKinds()";
      mode = "n";
      options.desc = "Open folds except kinds";
    }
    {
      key = "zm";
      action.__raw = "require('ufo').closeFoldsWith()";
      mode = "n";
      options.desc = "Close folds with";
    }
    {
      key = "zO";
      action.__raw = "require('ufo').openFold()";
      mode = "n";
      options.desc = "Open fold under cursor";
    }
    {
      key = "zC";
      action.__raw = "require('ufo').closeFold()";
      mode = "n";
      options.desc = "Close fold under cursor";
    }
    {
      key = "zp";
      action.__raw = "require('ufo').peekFoldedLinesUnderCursor()";
      mode = "n";
      options.desc = "Peek folded lines under cursor";
    }
  ];
}
