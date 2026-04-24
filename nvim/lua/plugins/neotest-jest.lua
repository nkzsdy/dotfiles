return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(opts.adapters, require("neotest-jest")())
    end,
    init = function()
      -- テストファイル保存時のみ実行（VSCode の jest.autoRun.onSave: "test-file" 相当）
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.test.ts", "*.test.tsx", "*.spec.ts", "*.spec.tsx" },
        callback = function()
          require("neotest").run.run(vim.fn.expand("%:p"))
        end,
      })
    end,
  },
}
