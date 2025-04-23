return {
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
			vim.keymap.set("n", "<leader>h", ":DiffviewOpen<CR>", {silent = true, noremap = true})
			vim.keymap.set("n", "<leader>j", ":DiffviewFileHistory %<CR>", {silent = true, noremap = true})
			vim.keymap.set("n", "<leader>k", ":DiffviewClose<CR>", {silent = true, noremap = true})
			vim.opt.fillchars:append("diff:╱")
			vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#34462F' })
			vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#222222' })
			vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#2F4146' })
			vim.api.nvim_set_hl(0, 'DiffText', { bg = '#463C2F' })

			-- vim.api.nvim_set_hl(0, 'DiffviewWinSeparator', { fg = colors[9] })
			-- vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { fg = colors[9] })
			-- vim.api.nvim_set_hl(0, 'DiffviewFilePanelSelected', { fg = colors[6] })
			--
			-- vim.api.nvim_set_hl(0, 'DiffviewStatusAdded', { fg = colors[3], bold = true })
			-- vim.api.nvim_set_hl(0, 'DiffviewStatusUntracked', { fg = colors[8], bold = true })
			-- vim.api.nvim_set_hl(0, 'DiffviewStatusModified', { fg = colors[4], bold = true })
			-- vim.api.nvim_set_hl(0, 'DiffviewStatusRenamed', { fg = colors[3], bold = true })
			-- vim.api.nvim_set_hl(0, 'DiffviewStatusDeleted', { fg = colors[2], bold = true })
			-- vim.api.nvim_set_hl(0, 'DiffviewStatusIgnored', { fg = colors[9], bold = true })
		end
	}
}
