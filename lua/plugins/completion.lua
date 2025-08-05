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
						accept = '<tab>',
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
	      {"nvim-treesitter/nvim-treesitter"}
	    },
	    opts = {},
	    config = function ()
		require('CopilotChat').setup({
		    window = {
		        layout = 'float',
			width = 80, -- Fixed width in columns (reduced by 20%)
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
		vim.keymap.set("v", "<leader>ci", function()
			require("CopilotChat").select_prompt({
				-- window = {
				-- 	layout = 'vertical',
				-- 	width = 0.2, -- Fixed width in columns (reduced by 20%)
				-- 	border = 'double', -- 'single', 'double', 'rounded', 'solid'
				-- 	title = '🤖 AI Prompts',
				-- 	zindex = 100, -- Ensure window stays on top
				-- },
				selection = function(source)
					return require('CopilotChat.select').visual(source)
				end,
			})
		end, { desc = "Open CopilotChat Prompts" }
		)
		vim.keymap.set("n", "<leader>cp", function() -- Map <leader>co in normal mode to open CopilotChat
		    require("CopilotChat").open({
			      window = {
				layout = 'vertical',
				width = 0.2, -- Fixed width in columns (reduced by 20%)
				border = 'double', -- 'single', 'double', 'rounded', 'solid'
				title = '🤖 AI Assistant',
				zindex = 100, -- Ensure window stays on top
			      },
			      -- Use visual selection, fallback to current line
			      selection = function(source)
				return require('CopilotChat.select').line(source)
			      end,
   		    })
		end, { desc = "Open CopilotChat" })
		vim.keymap.set("v", "<leader>cp", function() -- Map <leader>co in visual mode to open CopilotChat
		    require("CopilotChat").open({
			    window ={
				layout = 'vertical',
				width = 0.2, -- Fixed width in columns (reduced by 20%)
				border = 'double', -- 'single', 'double', 'rounded', 'solid'
				title = '🤖 AI Assistant',
				zindex = 100, -- Ensure window stays on top
			    }
		    })
		end, { desc = "Open CopilotChat" })
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
