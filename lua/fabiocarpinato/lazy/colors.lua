return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
			})

			vim.cmd.colorscheme("gruvbox")

			vim.cmd.hi("Comment gui=none")
		end,
	},
}
