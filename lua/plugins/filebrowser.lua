return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					width = {
						min = 30,
						max = -1,
					}
				},
				update_focused_file = {
					enable = true
				}
			})
			vim.keymap.set("n", "<leader>d", ":NvimTreeToggle<CR>", {silent = true, noremap = true})
		end
	}
}
