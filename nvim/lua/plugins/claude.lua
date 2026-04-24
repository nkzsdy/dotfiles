return {
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<leader>a", group = "AI", icon = "󱜙" },
			},
		},
	},
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		lazy = false,
		opts = {
			terminal = {
				provider = "external",
				provider_opts = {
					external_terminal_cmd = function(cmd, env)
						-- 右側にtmuxペインを作成してclaudeを起動
						local env_parts = {}
						for k, v in pairs(env or {}) do
							table.insert(env_parts, k .. "=" .. v)
						end
						local env_prefix = #env_parts > 0 and (table.concat(env_parts, " ") .. " ") or ""
						return { "tmux", "split-window", "-h", "-p", "35", env_prefix .. cmd }
					end,
				},
			},
			diff_opts = {
				open_in_new_tab = true,
			},
		},
		keys = {
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", desc = "Send selection to Claude", mode = "v" },
			{ "<leader>as", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer", mode = "n" },
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject diff" },
		},
	},
}
