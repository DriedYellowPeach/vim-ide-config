local function get_project_rustanalyzer_settings()
  local handle = io.open(vim.fn.resolve(vim.fn.getcwd() .. "/./.rust-analyzer.json"))
  if not handle then
    return {}
  end
  local out = handle:read("*a")
  handle:close()
  local config = vim.json.decode(out)
  if type(config) == "table" then
    return config
  end
  return {}
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      codelens = {
        enabled = true,
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommende"
    opts = {
      tools = {
        -- executor = executors.termopen,
        -- reload_workspace_from_cargo_toml = true,
        float_win_config = {
          border = "rounded",
        },
        -- disable it because there is a change in neovim 0.10, refersh codelens will try to refresh all buffers
      },
      server = {
        on_attach = function(_, bufnr)
          -- NOTE: key map for expandMacro
          vim.keymap.set("n", "<leader>ce", function()
            vim.cmd.RustLsp("expandMacro")
          end, { desc = "Expand Macro", buffer = bufnr })
          -- FIX: Debug current line, this is all I can do now
          -- Really can not figure out why the debug codelens disappears
          -- And I am gonna now sleep well over this!
          vim.keymap.set("n", "<leader>dd", function()
            vim.cmd.RustLsp("debug")
          end, { desc = "Rust Deug line", buffer = bufnr })
          -- NOTE: key map for all debuggables
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust Debuggables", buffer = bufnr })
        end,
        default_settings = {
          -- NOTE: rust-analyzer language server configuration
          ["rust-analyzer"] = vim.tbl_deep_extend(
            "force",
            -- NOTE: Default settings
            {
              lens = {
                enable = true,
                run = {
                  enable = true,
                },
                debug = {
                  enable = true,
                },
              },
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                  enable = true,
                },
              },
              -- Add clippy lints for Rust.
              checkOnSave = {
                enable = true,
                command = "clippy",
              },
              procMacro = {
                enable = true,
                ignored = {
                  -- ["async-trait"] = { "async_trait" },
                  -- ["napi-derive"] = { "napi" },
                  -- ["async-recursion"] = { "async_recursion" },
                },
              },
              diagnostics = {
                enable = true,
                disabled = { "unresolved-proc-macro", "proc-macro-disabled" },
                enableExperimental = true,
              },
            },
            -- NOTE: load .rust-analyzer.json if exists
            get_project_rustanalyzer_settings()
          ),
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
      if vim.fn.executable("rust-analyzer") == 0 then
        LazyVim.error(
          "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
          { title = "rustaceanvim" }
        )
      end
    end,
  },
}
