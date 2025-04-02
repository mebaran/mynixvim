{
  plugins.codecompanion = {
    enable = true;
    settings = {
      log_level = "DEBUG";
      strategies = {
        chat.adapter = "anthropic";
        inline.adapter = "anthropic";
        agent.adapter = "anthropic";
      };
      display = {
        diff = {
          enabled = true;
          close_chat_at = 240;  #Close an open chat buffer if the total columns of your display are less than...
          layout = "vertical"; #vertical|horizontal split for default provider
          provider = "mini_diff"; #default|mini_diff
        };
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
  plugins.fidget.luaConfig.post = builtins.readFile ./lua/codecompanion_fidget.lua;
}
