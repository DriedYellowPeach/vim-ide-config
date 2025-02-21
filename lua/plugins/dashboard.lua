local function setup_dashboard()
  math.randomseed(os.time())
  local candidates = require("utils.artwork").headers()
  local logo = candidates[math.random(1, #candidates)]
  -- NOTE: Add new lines as padding
  logo = string.rep("\n", 3) .. logo .. "\n"

  local opts = {
    theme = "doom",
    hide = {
      -- NOTE: this is taken care of by lualine
      -- enabling this messes up the actual laststatus setting after loading a file
      statusline = false,
    },
    config = {
      header = vim.split(logo, "\n"),
      center = {
        {
          action = "lua LazyVim.pick()()",
          desc = " Find File",
          icon = " ",
          key = "f",
        },
        {
          action = "ene | startinsert",
          desc = " New File",
          icon = " ",
          key = "n",
        },
        {
          action = 'lua LazyVim.pick("oldfiles")()',
          desc = " Recent Files",
          icon = " ",
          key = "r",
        },
        {
          action = function()
            vim.api.nvim_input("<cmd>Telescope projects<cr>")
          end,
          desc = " Projects ",
          icon = " ",
          key = "p",
        },
        {
          action = "lua LazyVim.pick.config_files()()",
          desc = " Config",
          icon = " ",
          key = "c",
        },
        {
          action = function()
            vim.api.nvim_input("<cmd>qa<cr>")
          end,
          desc = " Quit",
          icon = " ",
          key = "q",
        },
      },
      footer = function()
        local art_text = require("utils.artwork").ascii_art()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local lazy_info = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
        art_text[#art_text + 1] = lazy_info
        return art_text
      end,
    },
  }

  for _, button in ipairs(opts.config.center) do
    button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
    -- NOTE:: use this pair to embed key, a
    -- looks really cool!
    button.key_format = "\u{e0d2}%s\u{e0d4}"
  end

  if vim.o.filetype == "lazy" then
    vim.api.nvim_create_autocmd("WinClosed", {
      pattern = tostring(vim.api.nvim_get_current_win()),
      once = true,
      callback = function()
        vim.schedule(function()
          vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
        end)
      end,
    })
  end

  return opts
end

return {
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    -- NOTE: This is a totally override to the orginal settings
    opts = setup_dashboard(),
  },
}
