return {
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		config = function()
			require('copilot').setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 500,
					keymap = {
						accept = '<C-l>',
						next = '<C-n>',
						previous = '<C-p>',
						toggle = '<C-e>',
					},
				},
				panel = {
					enabled = false,
					-- keymap = {
					-- 	open = "<C-c>"
					-- }
				},
			})
		end,
	},
	{
	    "CopilotC-Nvim/CopilotChat.nvim",
	    dependencies = {
	      { "nvim-lua/plenary.nvim", branch = "master" },
	    },
	    opts = {},
	    config = function ()
		    require('CopilotChat').setup({
			  window = {
			    layout = 'float',
			    width = 80, -- Fixed width in columns
			    height = 20, -- Fixed height in rows
			    border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
			    title = '🤖 AI Assistant',
			    zindex = 100, -- Ensure window stays on top
			  },

			  headers = {
			    user = '👤 You: ',
			    assistant = '🤖 Copilot: ',
			    tool = '🔧 Tool: ',
			  },
			  separator = '━━',
			  show_folds = false, -- Disable folding for cleaner look
		    })
		    vim.api.nvim_set_keymap('v', '<leader>ci' ,':CopilotChatPrompts<CR>', {noremap = false, silent = true})
		    vim.api.nvim_set_keymap('n', '<leader>co' ,':CopilotChatOpen<CR>', {noremap = false, silent = true})
	    end
	  },
}

