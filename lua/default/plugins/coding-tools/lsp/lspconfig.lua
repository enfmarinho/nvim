return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"SmiteshP/nvim-navbuddy",
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local opts = { noremap = true, silent = true }
		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "See available fixes"
			vim.keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.code_action, opts)

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "<leader>lg", vim.lsp.buf.declaration, opts)

			opts.desc = "Show buffer diagnostics"
			vim.keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, opts)

			-- opts.desc = "Show LSP references and definitions"
			-- vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

			-- opts.desc = "Show LSP definitions"
			-- vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

			-- opts.desc = "Show LSP implementations"
			-- vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

			-- opts.desc = "Show LSP type definitions"
			-- vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
		end

		local default_capabilities = {
			textDocument = {
				completion = {
					editsNearCursor = true,
				},
			},
			offsetEncoding = "utf-16",
		}

		local signs = { Error = "", Warn = "", Hint = "", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Configure cpp server
		lspconfig.clangd.setup({
			capabilities = default_capabilities,
			on_attach = on_attach,
		})
		-- Configure cmake server
		lspconfig.cmake.setup({
			capabilities = default_capabilities,
			on_attach = on_attach,
		})
		-- Configure go server
		lspconfig.gopls.setup({
			capabilities = default_capabilities,
			on_attach = on_attach,
		})
		-- Configure python server
		lspconfig.ruff_lsp.setup({
			capabilities = default_capabilities,
			on_attach = on_attach,
		})
		-- Configure lua server
		lspconfig.lua_ls.setup({
			capabilities = default_capabilities,
			on_attach = on_attach,
		})
		-- Configure swift server
		lspconfig.sourcekit.setup({
			capabilities = default_capabilities,
			on_attach = on_attach,
			filetypes = { "swift" },
		})
	end,
}
