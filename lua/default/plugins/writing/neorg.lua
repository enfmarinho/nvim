return {
	"nvim-neorg/neorg",
	ft = "norg",
	event = "VeryLazy",
	enabled = true,
	version = "*",
	build = ":Neorg sync-parsers",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.ui.calendar"] = {},
				["core.keybinds"] = {
					config = {
						default_keybinds = true,
						hook = function(keybinds)
							keybinds.map(
								"norg",
								"n",
								"<enter>",
								"<cmd> Neorg keybind norg core.esupports.hop.hop-link <cr>",
								{ desc = "Hop link" }
							)
						end,
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/Notes/",
						},
						default_workspace = "notes",
						index = "index.norg",
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>no", "<cmd> Neorg <cr>", { desc = "Open neorg" })
		vim.keymap.set("n", "<leader>ni", "<cmd> Neorg index <cr>", { desc = "Open neorg index" })
		vim.keymap.set("n", "<leader>nj", "<cmd> Neorg journal toc open <cr>", { desc = "Open neorg journal" })
		vim.keymap.set("n", "<leader>nr", "<cmd> Neorg journal today <cr>", { desc = "Open today's report" })
		vim.keymap.set("n", "<leader>ns", "<cmd> Neorg toc <cr>", { desc = "Open table of contents" })
		vim.keymap.set("n", "<leader>nt", "<cmd> e ~/Notes/TO-DO.norg <cr>", { desc = "Open TO-DO list" })

		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
	end,
}
