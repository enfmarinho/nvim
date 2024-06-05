return {
	"utilyre/barbecue.nvim",
	enabled = false,
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.opt.updatetime = 200
		require("barbecue").setup({
			theme = "auto",

			attach_navic = true,
			show_navic = true,

			create_autocmd = false,

			include_buftypes = { "" },
			exclude_filetypes = { "netrw", "toggleterm" },

			modifiers = {
				dirname = ":~:.",
				basename = "",
			},
			show_dirname = false,
			show_basename = false,
			show_modified = true,
			context_follow_icon_color = false,

			modified = function(bufnr)
				return vim.bo[bufnr].modified
			end,
			lead_custom_section = function()
				return " "
			end,
			custom_section = function()
				return " "
			end,

			symbols = {
				modified = "●",
				ellipsis = "…",
				separator = "",
			},
			kinds = {
				File = "",
				Module = "",
				Namespace = "",
				Package = "",
				Class = "",
				Method = "",
				Property = "",
				Field = "",
				Constructor = "",
				Enum = "",
				Interface = "",
				Function = "",
				Variable = "",
				Constant = "",
				String = "",
				Number = "",
				Boolean = "",
				Array = "",
				Object = "",
				Key = "",
				Null = "",
				EnumMember = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			},
		})

		vim.api.nvim_create_autocmd({
			"WinScrolled",
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",
			-- "BufModifiedSet", -- include this if you have set `show_modified` to `true`
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
}
