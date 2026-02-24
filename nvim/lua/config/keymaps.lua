-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- ; と : を入れ替え
map("n", ";", ":", { noremap = true })
map("n", ":", ";", { noremap = true })
map("v", ";", ":", { noremap = true })
map("v", ":", ";", { noremap = true })

-- x でヤンクしない
map("n", "x", '"_x', { noremap = true, silent = true })

-- ペースト時にヤンクしない
map("v", "p", '"_dP', { noremap = true, silent = true })

-- 全選択
map("n", "<C-a>", "gg<S-v>G", { noremap = true, silent = true })

-- タブ操作
map("n", "te", ":tabedit ", { noremap = true })
map("n", "gn", "<cmd>tabnew<CR>", { noremap = true, silent = true })
map("n", "gh", "gT", { noremap = true, silent = true })
map("n", "gl", "gt", { noremap = true, silent = true })

-- ウィンドウ分割
map("n", "ss", "<cmd>split<CR><C-w>w", { noremap = true, silent = true })
map("n", "sv", "<cmd>vsplit<CR><C-w>w", { noremap = true, silent = true })

-- コンマの後にスペースを自動挿入
map("i", ",", ",<Space>", { noremap = true })

-- ESC*2 でハイライト解除
map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })
