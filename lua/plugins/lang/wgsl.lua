vim.api.nvim_create_autocmd("FileType", {
  pattern = "wgsl",
  callback = function()
    vim.bo.shiftwidth = 4
  end,
})

-- WARN: Still don't know if the shader language server will work like normal
-- But it seems that the community is not dead entirely, so this is it for now.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        wgsl_analyzer = {
          settings = {
            ["wgsl-analyzer"] = {},
          },
          -- handlers = {
          --   ["wgsl-analyzer/requestConfiguration"] = function()
          --     return {
          --       success = true,
          --       customImports = { _dummy_ = "dummy" },
          --       shaderDefs = {},
          --       trace = {
          --         extension = false,
          --         server = false,
          --       },
          --       inlayHints = {
          --         enabled = true,
          --         typeHints = true,
          --         parameterHints = true,
          --         structLayoutHints = true,
          --         typeVerbosity = "inner",
          --       },
          --       diagnostics = {
          --         typeErrors = true,
          --         nagaParsingErrors = true,
          --         nagaValidationErrors = true,
          --         nagaVersion = "main",
          --       },
          --     }
          --   end,
          -- },
        },
      },
    },
  },
}
