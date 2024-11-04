local hl_mapping = {
  red = "WhichKeyIconRed",
  blue = "WhichKeyIconBlue",
  cyan = "WhichKeyIconCyan",
  grey = "WhichKeyIconGrey",
  azure = "WhichKeyIconAzure",
  green = "WhichKeyIconGreen",
  orange = "WhichKeyIconOrange",
  purple = "WhichKeyIconPurple",
  yellow = "WhichKeyIconYellow",
}

local add_key_mapping = function()
  require("which-key").add({
    { "<leader>a", group = "ChatGPT", icon = { icon = "󱚥 ", hl = hl_mapping.azure } },
    { "<leader>ac", "<cmd>ChatGPT<CR>", desc = "ChatGPT", icon = { icon = "󰭻 ", hl = hl_mapping.green } },
    {
      "<leader>ae",
      "<cmd>ChatGPTEditWithInstruction<CR>",
      desc = "Edit with instruction",
      mode = { "n", "v" },
      icon = { icon = " ", hl = hl_mapping.cyan },
    },
    {
      "<leader>ag",
      "<cmd>ChatGPTRun grammar_correction<CR>",
      desc = "Grammar Correction",
      mode = { "n", "v" },
      icon = { icon = " ", hl = hl_mapping.blue },
    },
    {
      "<leader>ad",
      "<cmd>ChatGPTRun docstring<CR>",
      desc = "Docstring",
      mode = { "n", "v" },
      icon = { icon = "󰈙 ", hl = hl_mapping.grey },
    },
    {
      "<leader>at",
      "<cmd>ChatGPTRun add_tests<CR>",
      desc = "Add Tests",
      mode = { "n", "v" },
      icon = { icon = "󰇉 ", hl = hl_mapping.red },
    },
    {
      "<leader>ao",
      "<cmd>ChatGPTRun optimize_code<CR>",
      desc = "Optimize Code",
      mode = { "n", "v" },
      icon = { icon = "󱐋", hl = hl_mapping.yellow },
    },
    {
      "<leader>as",
      "<cmd>ChatGPTRun summarize<CR>",
      desc = "Summarize",
      mode = { "n", "v" },
      icon = { icon = "", hl = hl_mapping.purple },
    },
    {
      "<leader>af",
      "<cmd>ChatGPTRun fix_bugs<CR>",
      desc = "Fix Bugs",
      mode = { "n", "v" },
      icon = { icon = "󰨮 ", hl = hl_mapping.red },
    },
    {
      "<leader>ax",
      "<cmd>ChatGPTRun explain_code<CR>",
      desc = "Explain Code",
      mode = { "n", "v" },
      icon = { icon = " ", hl = hl_mapping.yellow },
    },

    -- r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
    -- l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
    -- t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
    -- k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
  })
end

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

      add_key_mapping()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim",
    },
  },
}
