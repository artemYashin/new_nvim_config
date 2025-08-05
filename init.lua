vim.wo.number = true
vim.diagnostic.config({virtual_text=true})
-- vim.opt.cmdheight = 0

require("core.keymaps")
require("core.lazy")
vim.opt.splitright = true
vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat",
  callback = function()
    vim.cmd("TSBufEnable highlight")
  end,
})

