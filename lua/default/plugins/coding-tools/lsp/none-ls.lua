return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	commit = "bb680d752cec37949faca7a1f509e2fe67ab418a",
	enabled = "leetcode.nvim" ~= vim.fn.argv()[1],
	opts = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local opts = {
			sources = {
				formatting.cmake_format,
				formatting.clang_format,
				formatting.stylua,
				formatting.rustfmt,
				formatting.gofumpt,
				formatting.goimports_reviser,
				formatting.golines,
				formatting.black,
				formatting.swiftlint,
				formatting.swiftformat,
				-- formatting.reorder_python_imports,
				-- diagnostics.credo,
				-- formatting.mix,
				-- diagnostics.pylint,
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
