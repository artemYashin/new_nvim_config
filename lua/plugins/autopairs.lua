return {
	{
	    'windwp/nvim-ts-autotag',
	    config = function()
		    require("nvim-ts-autotag").setup()
	    end
	},
	{
	    'altermo/ultimate-autopair.nvim',
	    event={'InsertEnter','CmdlineEnter'},
	    branch='v0.6', --recommended as each new version will have breaking changes
	    opts={
		--Config goes here
	    },
	}
}
