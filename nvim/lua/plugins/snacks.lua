return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    -- 新規ファイルをノーマルモードで開く（デフォルトは :ene | startinsert）
    for _, key in ipairs((opts.dashboard or {}).preset and opts.dashboard.preset.keys or {}) do
      if key.key == "n" then
        key.action = ":ene"
        break
      end
    end

    opts.gitbrowse = vim.tbl_extend("force", opts.gitbrowse or {}, { what = "permalink" })
    opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
      win = {
        input = {
          keys = {
            ["<C-PageUp>"] = { "history_back", mode = { "i", "n" } },
            ["<C-PageDown>"] = { "history_forward", mode = { "i", "n" } },
          },
        },
      },
    })
    return opts
  end,
}
