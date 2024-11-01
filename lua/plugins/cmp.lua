return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local cmp_window = require("cmp.config.window")
      opts.completion = {
        completeopt = "menu,menuone,noinsert" .. ",noselect",
      }
      -- NOTE: Orginally, it show path in last segment,
      -- which makes the float wind extremely wide, diable it
      opts.formatting.fields = { "abbr", "kind", "menu" }
      opts.formatting.format = function(entry, item)
        local source_names = {
          nvim_lsp = "(LSP)",
          emoji = "(Emoji)",
          path = "(Path)",
          calc = "(Calc)",
          cmp_tabnine = "(Tabnine)",
          vsnip = "(Snippet)",
          luasnip = "(Snippet)",
          buffer = "(Buffer)",
          tmux = "(TMUX)",
          copilot = "(Copilot)",
          treesitter = "(TreeSitter)",
        }

        local icons = LazyVim.config.icons.kinds
        if icons[item.kind] then
          item.kind = icons[item.kind] .. item.kind
        end

        item.menu = source_names[entry.source.name]

        local widths = {
          abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
          menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 10,
        }

        for key, width in pairs(widths) do
          if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
            item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
          end
        end

        return item
      end

      opts.preselect = cmp.PreselectMode.None
      opts.mapping["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      opts.mapping["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
      opts.mapping["<CR>"] = LazyVim.cmp.confirm({ select = false })
      opts.window = {
        completion = cmp_window.bordered(),
        documentation = cmp_window.bordered(),
      }

      local types = require("cmp.types")
      local compare = require("cmp.config.compare")
      local kind_comparator = function(entry1, entry2)
        local kind1 = entry1:get_kind() --- @type lsp.CompletionItemKind | number
        local kind2 = entry2:get_kind() --- @type lsp.CompletionItemKind | number
        -- NOTE: Too many Snippets in rust completions
        -- So I set the weight to 0 if the entry is Snippet
        -- So it goes to the bottom of the list
        -- For the most recently used completion type(sort by priority):
        -- we have Struct > Constant > EnumMember > Enum > Variable > Field > Function > Method > Text > Snippet
        -- HACK: Change the weight to make it more ergonomic
        kind1 = kind1 == types.lsp.CompletionItemKind.Snippet and 0 or kind1
        kind2 = kind2 == types.lsp.CompletionItemKind.Snippet and 0 or kind2

        if kind1 ~= kind2 then
          local diff = kind2 - kind1
          if diff < 0 then
            return true
          elseif diff > 0 then
            return false
          end
        end
        return nil
      end

      opts.sorting = {
        priority_weight = 2,
        comparators = {
          compare.offset,
          compare.exact,
          compare.score,
          kind_comparator,
          compare.recently_used,
          compare.locality,
          compare.length,
          compare.order,
        },
      }
    end,
  },
}
