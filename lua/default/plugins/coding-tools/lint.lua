return {
	"mfussenegger/nvim-lint",
	enabled = false,
	event = "VeryLazy",
	config = function()
		require("lint").linters_by_ft = {
			cpp = { "cppcheck" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
				require("lint").try_lint("cspell")
			end,
		})
	end,
}
