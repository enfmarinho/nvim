return {
	"folke/neodev.nvim",
	event = "VeryLazy",
	enabled = true,
	opts = {
		library = {
			enabled = true,
			runtime = true,
			types = true,
			plugins = true,
		},
		setup_jsonls = true,
		lspconfig = true,
		pathStrict = true,
	},
}
