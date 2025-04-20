return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true, frecency = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			terminal = {
				win = {
					wo = {
						winbar = ""
					}
				}
			}
		},
		keys = {
			-- LSP
			{ "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
			{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
			{ "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
			-- Buffers
			{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
			{ "<A-c>", function() Snacks.bufdelete.delete(opts) end, desc = "Buffer delete" },
			-- Find
			{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
			{ "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
			-- Git
			{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
			{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
			{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
			-- Terminal
			{ "<leader>t",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
		}
	},
}
