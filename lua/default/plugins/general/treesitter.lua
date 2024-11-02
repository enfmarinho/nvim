return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-refactor",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"cpp",
				"diff",
				"doxygen",
				"java",
				"gitignore",
				"llvm",
				"make",
				"markdown",
				"go",
				"norg",
				"markdown",
				"markdown_inline",
				"rust",
				"bash",
				"regex",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = false,

			-- List of parsers to ignore installing (or "all")
			ignore_install = {},

			highlight = {
				enable = true,

				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,

				additional_vim_regex_highlighting = false,
			},

			refactor = {
				navigation = {
					enable = true,
					-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
					keymaps = {
						goto_definition = "false",
						list_definitions = "false",
						list_definitions_toc = "false",
						goto_next_usage = "<leader>tn",
						goto_previous_usage = "<leader>tp",
					},
				},
				smart_rename = {
					enable = true,
					keymaps = {
						smart_rename = "false",
					},
				},
				highlight_current_scope = { enable = false },
				highlight_definitions = {
					enable = true,
					clear_on_cursor_move = true,
				},
			},
		})
	end,
}
