return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
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
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("treesitter-setup", { clear = true }),
			callback = function(args)
				if vim.bo[args.buf].buftype ~= "" then
					return
				end

				local ignored_fts = { "oil", "TelescopePrompt", "lazy" }
				if vim.tbl_contains(ignored_fts, vim.bo[args.buf].filetype) then
					return
				end

				pcall(function()
					vim.treesitter.start(args.buf)
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end)
			end,
		})
	end,
}
