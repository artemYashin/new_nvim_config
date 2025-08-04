-- For `plugins/markview.lua` users.
-- return {
--     "OXY2DEV/markview.nvim",
--
--     -- For blink.cmp's completion
--     -- source
--     -- dependencies = {
--     --     "saghen/blink.cmp"
--     -- },
-- };
--
return {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function ()
	    require('render-markdown').setup({
		    file_types = {'markdown', 'copilot-chat'}
	    })
    end
}
