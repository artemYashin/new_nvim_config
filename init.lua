vim.wo.number = true
vim.diagnostic.config({ virtual_text = true })
-- vim.opt.cmdheight = 0

require("core.keymaps")
require("core.lazy")

vim.opt.splitright = true
vim.api.nvim_create_autocmd("FileType", {
	pattern = "codecompletion",
	callback = function()
		vim.cmd("TSBufEnable highlight")
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "twig",
	callback = function()
		vim.cmd("TSBufEnable highlight")
	end,
})

function PromptToCommand(mode, defaultPrompt)
	local run_command = function(input)
		if not input then
			return
		end
		local cmd_input = vim.fn.escape(input, " ")

		if mode == "v" then
			-- Get the visual selection range
			local start_line = vim.fn.line("v")
			local end_line = vim.fn.line(".")

			if start_line > end_line then
				start_line, end_line = end_line, start_line
			end

			local range = string.format("%d,%d", start_line, end_line)

			vim.cmd(range .. "CodeCompanion " .. cmd_input)
			vim.notify(range .. "CodeCompanion " .. cmd_input)
		else
			vim.cmd("CodeCompanion " .. cmd_input)
		end
	end

	if defaultPrompt then
		run_command(defaultPrompt)
	else
		vim.ui.input({ prompt = "Enter text for :CodeCompanion: " }, run_command)
	end
end

-- Toggle the CodeCompanion chat window
vim.keymap.set({ "n", "v" }, "<leader>cl", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- Keymaps for CodeCompanion plugin
-- Visual selection to add content to chat
vim.keymap.set("v", "<leader>cv", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
-- Open actions menu for CodeCompanion
vim.keymap.set({ "n", "v" }, "<leader>cp", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- Send current buffer to CodeCompanion
vim.keymap.set("n", "<leader>cc", function()
	PromptToCommand("n")
end, { noremap = true, silent = true })
-- Send selected text to CodeCompanion
vim.keymap.set("v", "<leader>cc", function()
	PromptToCommand("v")
end, { noremap = true, silent = true })
vim.keymap.set("v", "<leader>cb", function()
	PromptToCommand(
		"v",
		"Add comment for the selected code block. If it is typescript or js do it in jsdoc. Write your comment above or below selected code. If it is JSX or TSX use appropriate commenting format."
	)
end, { noremap = true, silent = true })
