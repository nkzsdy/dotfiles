return {
  {
    "ramojus/mellifluous.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("mellifluous").setup({
        transparent_background = { enabled = false },
        dim_inactive = false,
      })
    end,
  },

  -- LazyVim のデフォルトカラースキームを上書き
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "mellifluous",
    },
  },
}
