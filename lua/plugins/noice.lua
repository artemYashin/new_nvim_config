return {
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		priorty = 998,
		opts = {
		-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				presets = {
					lsp_doc_border = true
				}
			})
			vim.keymap.set('n', 'K',
				function()
					if not require("noice.lsp").hover() then
						return "K"
					end
				end
			)
		end
	}
}
