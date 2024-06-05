return {
	"preservim/vim-markdown",
	ft = "markdown",
	event = "VeryLazy",
	enabled = true,
	config = function()
		local opts = {
			vim_markdown_folding_disabled = 1,
			vim_markdown_no_default_key_mappings = 1,
		}
		for option, value in pairs(opts) do
			vim.g[option] = value
		end
	end,
}
