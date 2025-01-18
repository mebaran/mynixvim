{
  plugins.codecompanion = {
    enable = true;
    settings = {
      strategies = {
        chat.adapter = "anthropic";
        inline.adapter = "anthropic";
      };
    };
  };
  keymaps = [
    {
      mode = ["n" "v"];
      key = "<C-a>";
      action = "<cmd>CodeCompanionActions<cr>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<LocalLeader>a";
      action = "<cmd>CodeCompanionChat Toggle<cr>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "v";
      key = "ga";
      action = "<cmd>CodeCompanionChat Add<cr>";
      options = {
        noremap = true;
        silent = true;
      };
    }
  ];
}
