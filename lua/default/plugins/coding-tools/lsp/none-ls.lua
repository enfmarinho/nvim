return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	enabled = "leetcode.nvim" ~= vim.fn.argv()[1],
	opts = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local opts = {
			sources = {
				formatting.clang_format.with({
					args = {
						"-style=file",
						"--fallback-style=google",
						"--offset",
						"--length",
						{ use_length = true, row_offset = -1, col_offset = -1 },
					},
				}),
				formatting.cmake_format,
				formatting.stylua,
				formatting.gofumpt,
				formatting.goimports_reviser,
				formatting.golines,
				formatting.swiftlint,
				formatting.swiftformat,
				formatting.mix,
			},

			-- autoformatting on save.
			on_attach = function(client, bufnr)
				if vim.fn.line("$") > 10000 then
					return
				end

				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		}

		return opts
	end,
}
