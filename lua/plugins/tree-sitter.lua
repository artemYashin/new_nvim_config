return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "bash", "html", "lua", "markdown", "typescript", "tsx" },
				autoInstall = true,
				hightlight = {
					enabled = true,
				},
				indent = { enabled = true },
			})
			vim.api.nvim_create_autocmd('FileType', {
				pattern = { 'codecompletion', 'twig', 'typescript', 'javascript', 'typescriptreact', 'html', 'json', 'javascriptreact' },
				callback = function() vim.treesitter.start() end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
}
