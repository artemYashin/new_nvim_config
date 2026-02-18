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
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "󰌵",
					},
				},
			})
			require("neo-tree").setup({
				hide_root_node = true,
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
				default_component_configs = {
					icon = {
						folder_clasdosed = "󰉋",
						folder_open = "󰝰",
					},
					git_status = {
						symbols = {
							-- Change type
							added = "✚", -- or "✚"
							modified = "", -- or ""
							deleted = "✖", -- this can only be used in the git_status source
							renamed = "󰁕", -- this can only be used in the git_status source
							-- Status type
							untracked = "",
							ignored = "",
							unstaged = "󱣯",
							staged = "󰮚",
							conflict = "",
						},
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
