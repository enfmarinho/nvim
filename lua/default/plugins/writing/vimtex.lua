return {
	"lervag/vimtex",
	enabled = true,
	ft = { "latex", "tex" },
	event = "VeryLazy",
	init = function()
		vim.g.vimtex_compiler_latexmk = {
			out_dir = "build",
			options = {
				"-pdf",
				"-interaction=nonstopmode",
				"-synctex=1",
				"-outdir=build",
				"-auxdir=build",
			},
		}
	end,
}
