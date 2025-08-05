return {
	-- {
	-- 	'github/copilot.vim',
	-- },
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		config = function()
			require('copilot').setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 200,
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
			width = 100, -- Fixed width in columns
			height = 40,
			border = 'double', -- 'single', 'double', 'rounded', 'solid'
			title = '🤖 AI Assistant',
			zindex = 100, -- Ensure window stays on top
		    },
		    insert_at_end = false,
		    headers = {
			user = '👤 You: ',
			assistant = '🤖 Copilot: ',
			tool = '🔧 Tool: ',
		    },
		    separator = '━━',
		    show_folds = false, -- Disable folding for cleaner look
		})
		vim.api.nvim_set_keymap('v', '<leader>ci' ,':CopilotChatPrompts<CR>', {noremap = false, silent = true}) -- Map <leader>ci in visual mode to open CopilotChat prompts
		vim.keymap.set("n", "<leader>co", function() -- Map <leader>co in normal mode to open CopilotChat
		    require("CopilotChat").open({
			      -- Use visual selection, fallback to current line
			      selection = function(source)
				return require('CopilotChat.select').line(source)
			      end,
   		    })
		end, { desc = "Open CopilotChat" })
		vim.keymap.set("v", "<leader>co", function() -- Map <leader>co in visual mode to open CopilotChat
		    require("CopilotChat").open()
		end, { desc = "Open CopilotChat" })
	    end
	  },
}
