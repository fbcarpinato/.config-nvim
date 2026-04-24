return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup({
			headerMaxWidth = 80,
		})

		vim.keymap.set("n", "<leader>sr", function()
			require("grug-far").open({
				transient = true,
			})
		end, { desc = "Search and Replace (Grug-far)" })
	end,
}
