return {
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-python"] = {
          is_test_file = function(file_path)
            local patterns = { "interview", "test_", "_spec" } -- Add more patterns as needed
            for _, pattern in ipairs(patterns) do
              if file_path:match(pattern) then
                return true
              end
            end
            return false
          end,
        },
      },
    },
  },
}
