return {
	{
		"saghen/blink.cmp",
		build = "cargo build --release",
		opts = {
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust" },
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				go = { "gofmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", version = "^1.0.0" },
			{ "williamboman/mason-lspconfig.nvim", version = "^1.0.0" },
			"saghen/blink.cmp",
		},

		opts = {
			servers = {
				lua_ls = {},
				rust_analyzer = {},
				ts_ls = {},
				gopls = {},
			},
		},

		config = function(_, opts)
			local lspconfig = require("lspconfig")

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(opts.servers),
			})

			for server, config in pairs(opts.servers) do
				local capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = { "stylua", "prettierd" },
		},
	},
}
