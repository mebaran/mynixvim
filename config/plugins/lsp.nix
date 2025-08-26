{
  plugins = {
    lsp = {
      enable = true;
      capabilities = "require('blink.cmp').get_lsp_capabilities()";
    };
    lspsaga = {
      enable = true;
      settings.lightbulb.virtualText = false;
    };
  };
  autoCmd = [
    {
      desc = "Configure LSP keymaps and omnifunc";
      event = "LspAttach";
      callback.__raw = ''
        function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
      '';
    }
  ];
  keymapsOnEvents.LspAttach = let
    lspsaga = action: "<cmd>Lspsaga ${action}<cr>";
  in [
    {
      mode = "n";
      key = "gF";
      action = lspsaga "finder";
      options.desc = "Goto symbol finder";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "gD";
      action.__raw = "vim.lsp.buf.declaration";
      options.desc = "Goto declaration";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "gd";
      action.__raw = "vim.lsp.buf.definition";
      options.desc = "Goto definition";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "gI";
      action.__raw = "vim.lsp.buf.implementation";
      options.desc = "Goto implementation";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "gr";
      action.__raw = "vim.lsp.buf.references";
      options.desc = "Goto references";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "K";
      action = lspsaga "hover_doc";
      options.buffer = true;
    }
    {
      mode = ["i" "n"];
      key = "<C-k>";
      action.__raw = "vim.lsp.buf.signature_help";
      options.desc = "Signature help";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "<leader>wa";
      action.__raw = "vim.lsp.buf.add_workspace_folder";
      options.desc = "Add workspace folder";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "<leader>wr";
      action.__raw = "vim.lsp.buf.remove_workspace_folder";
      options.desc = "Remove workspace folder";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "<leader>wl";
      action.__raw = ''        function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end'';
      options.desc = "Print workspace folders list";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = lspsaga "peek_definition";
      options.desc = "Peek definition";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "<leader>gy";
      action = lspsaga "peek_type_definition";
      options.desc = "Peek t(y)pe definition";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "<leader>cr";
      action.__raw = "vim.lsp.buf.rename";
      options.desc = "Code rename";
      options.buffer = true;
    }
    {
      mode = "n";
      key = "<leader>ca";
      action = lspsaga "code_action";
      options.desc = "Code action";
      options.buffer = true;
    }
    {
      mode = ["n" "v"];
      key = "<leader>=";
      action.__raw = "vim.lsp.buf.format";
      options.desc = "Code format";
      options.buffer = true;
    }
  ];
  keymaps = [
    {
      mode = "n";
      key = "<C-;>";
      action = "<cmd>Lspsaga term_toggle<cr>";
      options.desc = "Toggle floating terminal";
    }
  ];
}
