return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"vimdoc",
				"javascript",
				"typescript",
				"c",
				"lua",
				"rust",
				"jsdoc",
				"bash",
				"go",
				"http",
				"json",
			},
			-- Automatically install missing parsers when entering buffer
			auto_install = true,
			highlight = {
				enable = true,
				-- Disable highlighting for these filetypes
				disable = { "oil", "TelescopePrompt", "lazy" },
			},
			indent = {
				enable = true,
			},
		})
	end,
}
