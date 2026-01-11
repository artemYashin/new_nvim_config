return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		config = function()
			require("neo-tree").setup({
				sources = {
					"filesystem",
					"document_symbols",
				},
				window = {
					auto_expand_width = true,
					mappings = {
						["o"] = "open",
						["oc"] = false,
						["od"] = false,
						["og"] = false,
						["om"] = false,
						["on"] = false,
						["os"] = false,
						["ot"] = false,
					},
				},
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
					},
					follow_current_file = {
						enabled = true,
						leave_dirs_open = false,
					},
				},
				buffers = {
					follow_current_file = {
						enabled = true,
					},
				},
			})
			vim.api.nvim_set_keymap("n", "<leader>d", ":Neotree toggle<CR>", { noremap = true, silent = true })
		end,
	},
}
