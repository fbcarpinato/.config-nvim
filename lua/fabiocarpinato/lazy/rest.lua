return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		lazy = false,
		config = true,
		opts = {
			rocks = { "dkjson", "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
		},
	},
	{
		"rest-nvim/rest.nvim",
		ft = { "http" },
		build = false,
		dependencies = {
			"vhyrro/luarocks.nvim",
			{
				"folke/which-key.nvim",
				optional = true,
				opts = {
					spec = {
						{ "<leader>r", group = "rest" },
					},
				},
			},
		},
		config = function()
			require("rest-nvim").setup()
		end,
		keys = {
			{ "<leader>rr", "<cmd>Rest run<cr>", desc = "Run rest http request under cursor" },
			{ "<leader>rc", "<cmd>Rest run last<cr>", desc = "Run last rest http request" },
			{ "<leader>re", "<cmd>Rest env select<cr>", desc = "Select env file" },
		},
	},
}
