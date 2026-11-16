return {
	"mrcjkb/rustaceanvim",
	lazy = false,
	enabled = true,
	init = function()
		vim.g.rustfmt_autosave = 0
		vim.g.rustfmt_emit_files = 1
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(client, bufnr)
					-- format on save with rustfmt
					local group = vim.api.nvim_create_augroup("RustFormatOnSave_" .. bufnr, { clear = true })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = group,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, filter = function(c) return c.name:match("rust.analyzer") ~= nil end })
						end,
					})

					local o = { buffer = bufnr, silent = true }
					vim.keymap.set("n", "<leader>ra", function()
						vim.cmd.RustLsp("codeAction")
					end, vim.tbl_extend("force", o, { desc = "Rust code action" }))
					vim.keymap.set("n", "<leader>rr", function()
						vim.cmd.RustLsp("runnables")
					end, vim.tbl_extend("force", o, { desc = "Rust runnables" }))
					vim.keymap.set("n", "<leader>rd", function()
						vim.cmd.RustLsp("debuggables")
					end, vim.tbl_extend("force", o, { desc = "Rust debuggables" }))
				end,
			},
		}
	end,
}
