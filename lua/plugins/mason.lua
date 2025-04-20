return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function() 
			require("mason-lspconfig").setup({
				ensure_installed = {"ts_ls", "eslint"}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('blink.cmp').get_lsp_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig['ts_ls'].setup({capabilities = capabilities})
			lspconfig['eslint'].setup({capabilities = capabilities})

			-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
			-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
			vim.cmd([[
			  autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
			]])
			vim.api.nvim_create_autocmd("CursorHold", {
			  buffer = bufnr,
			  callback = function()
			    local opts = {
			      focusable = false,
			      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			      border = 'rounded',
			      source = 'always',
			      prefix = ' ',
			      scope = 'cursor',
			    }
			    vim.diagnostic.open_float(nil, opts)
			  end
			})
		end
	}
}
