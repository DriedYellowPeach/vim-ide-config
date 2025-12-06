local components = function()
  -- NOTE: this makes my lualine looks like this:
  --  :[lua_ls|stylua]
  -- and with hightlight, looks neat
  local component_lsp = {
    function()
      local buf_clients = vim.lsp.get_clients({ bufnr = 0 })

      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" and client.name ~= "copilot" then
          table.insert(buf_client_names, client.name)
        end
      end

      -- add formatter
      local formatters = require("conform").list_formatters_to_run()
      for _, formatter in ipairs(formatters) do
        table.insert(buf_client_names, formatter.name)
      end

      local unique_client_names = vim.fn.uniq(buf_client_names)
      local final_client_names = type(unique_client_names) == "table" and unique_client_names or {}

      local language_servers = "%#StatusLineLspActive#"
        .. " "
        .. ":["
        .. "%*"
        .. table.concat(final_client_names, "%#StatusLineLspActive#" .. "|" .. "%*")
        .. "%#StatusLineLspActive#"
        .. "]"
        .. "%*"

      return language_servers
    end,
    cond = function()
      return #vim.lsp.get_clients({ bufnr = 0 }) > 0
    end,
  }

  local component_dap = {
    function()
      return "  " .. require("dap").status()
    end,
    cond = function()
      return package.loaded["dap"] and require("dap").status() ~= ""
    end,
    -- color = function()
    --   return LazyVim.ui.fg("Debug")
    -- end,
  }

  local component_spaces = {
    function()
      local shiftwidth = vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
      return "󰌒" .. " " .. shiftwidth
    end,
    color = {
      fg = "#ECBE7B",
    },
  }

  return {
    dap = component_dap,
    lsp = component_lsp,
    shiftwidth = component_spaces,
  }
end

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "AndreM222/copilot-lualine" },
    opts = function(_, opts)
      local comps = components()
      opts.options.component_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }
      -- NOTE: in this order!
      opts.sections.lualine_x = {
        comps.dap,
        comps.lsp,
        comps.shiftwidth,
      }
      opts.sections.lualine_z = {}
    end,
  },
}
