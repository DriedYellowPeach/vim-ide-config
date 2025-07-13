return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local fzf = require("fzf-lua")
    local actions = fzf.actions

    opts.files = {
      cwd_prompt = false,
      actions = {
        ["ctrl-l"] = { actions.toggle_ignore },
        ["ctrl-h"] = { actions.toggle_hidden },
      },
    }

    opts.grep = {
      actions = {
        ["ctrl-l"] = { actions.toggle_ignore },
        ["ctrl-h"] = { actions.toggle_hidden },
      },
    }

    return opts
  end,
}
