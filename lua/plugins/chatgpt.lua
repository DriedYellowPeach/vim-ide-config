return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        -- NOTE: I am loading api_key using env var
        api_key_cmd = "echo $OPENAI_API_KEY",
        -- NOTE: Load some customized role
        predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/DriedYellowPeach/awesome-chatgpt-prompts/refs/heads/main/prompts.csv",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim",
    },
  },
}
