local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("yamlls", {
  -- on_attach = on_attach,
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
  capabilities = require("lvim.lsp").common_capabilities(),
  settings = {
    yaml = {
      schemas = {
        -- ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
        -- ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        -- ["~/.config/alacritty/alacritty-config-schema.json"] = "alacritty.yaml"
      },
      schemaStore = {
        enable = true,
      },
    },
  },
})
