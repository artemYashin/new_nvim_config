return {
	"olimorris/codecompanion.nvim",
	-- List of dependencies required by the project
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"franco-ruggeri/codecompanion-spinner.nvim",
	},

	opts = {
		extensions = {
			spinner = {},
		},
		prompt_library = {
			["Explain Code"] = {
				interaction = "chat",
				description = "Explain how code works",
				opts = {
					auto_submit = true,
				},
				prompts = {
					{
						role = "system",
						content = "You are an expert programmer who excels at explaining code clearly and concisely.",
					},
					{
						role = "user",
						content = function(context)
							local text =
								require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
							return "Please explain the following code:\n\n```"
								.. context.filetype
								.. "\n"
								.. text
								.. "\n```"
						end,
					},
				},
				adapter = {
					name = "ollama",
					model = "qwen3-coder:30b",
				},
			},
		},
		adapters = {
			http = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						env = {
							url = "http://172.23.16.1:11434",
						},
						headers = {
							["Content-Type"] = "application/json",
						},
						parameters = {
							sync = true,
						},
					})
				end,
			},
		},
		interactions = {
			chat = {
				adapter = {
					name = "ollama",
					-- model = "gemma3:4b",
					model = "qwen3-coder:30b",
				},
			},
			inline = {
				adapter = {
					name = "ollama",
					-- model = "gemma3:4b",
					model = "qwen3-coder:30b",
					-- model = "deepseek-r1:14b",
				},
			},
			cmd = {
				adapter = {
					name = "ollama",
					-- model = "gemma3:4b",
					model = "qwen3-coder:30b",
				},
			},
			background = {
				adapter = {
					name = "ollama",
					-- model = "gemma3:4b",
					model = "qwen3-coder:30b",
				},
			},
		},
		-- NOTE: The log_level is in `opts.opts`
		opts = {
			log_level = "DEBUG", -- or "TRACE"
		},
	},
}
