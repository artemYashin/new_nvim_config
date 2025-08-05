return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = {"bash", "html", "lua", "markdown", "typescript", "tsx"},
				autoInstall = true,
				hightlight = {
					enabled = true,
				},
				indent = {enabled = true}
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	}
}
