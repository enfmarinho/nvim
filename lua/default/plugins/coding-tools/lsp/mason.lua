return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"clangd",
				"gopls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"cmakelang",
				"clang-format",
				"codelldb",
				"pyright",
				"lua-language-server",
				"rust-analyzer",
				"stylua",
				"goimports-reviser",
				"gofumpt",
				"golines",
				"pylint",
				"black",
				"reorder-python-imports",
				"elixir-ls",
			},
		})
	end,
}
