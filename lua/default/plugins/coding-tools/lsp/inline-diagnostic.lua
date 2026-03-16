return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	enabled = false,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern",

			transparent_bg = true,
			transparent_cursorline = true,

			-- Customize highlight groups for colors
			hi = {
				error = "DiagnosticError", -- Highlight for error diagnostics
				warn = "DiagnosticWarn", -- Highlight for warning diagnostics
				info = "DiagnosticInfo", -- Highlight for info diagnostics
				hint = "DiagnosticHint", -- Highlight for hint diagnostics
				arrow = "NonText", -- Highlight for the arrow pointing to diagnostic
				background = "CursorLine", -- Background highlight for diagnostics
				mixing_color = "Normal", -- Color to blend background with (or "None")
			},

			disabled_ft = {},

			options = {
				show_source = {
					enabled = false, -- Enable showing source names
					if_many = false, -- Only show source if multiple sources exist for the same diagnostic
				},
				use_icons_from_diagnostic = false,
				set_arrow_to_diag_color = false,

				throttle = 20, -- Throttle update frequency in milliseconds to improve performance

				softwrap = 30, -- Minimum number of characters before wrapping long messages

				-- Control how diagnostic messages are displayed
				add_messages = {
					messages = true, -- Show full diagnostic messages
					display_count = false, -- Show diagnostic count instead of messages when cursor not on line
					use_max_severity = false, -- When counting, only show the most severe diagnostic
					show_multiple_glyphs = true, -- Show multiple icons for multiple diagnostics of same severity
				},

				multilines = {
					enabled = true, -- Enable support for multiline diagnostic messages
					always_show = true, -- Always show messages on all lines of multiline diagnostics
					trim_whitespaces = false, -- Remove leading/trailing whitespace from each line
					tabstop = 4, -- Number of spaces per tab when expanding tabs
					severity = nil, -- Filter multiline diagnostics by severity (e.g., { vim.diagnostic.severity.ERROR })
				},

				show_all_diags_on_cursorline = true,

				-- Display related diagnostics from LSP relatedInformation
				show_related = {
					enabled = true, -- Enable displaying related diagnostics
					max_count = 3, -- Maximum number of related diagnostics to show per diagnostic
				},

				enable_on_insert = false, -- Enable diagnostics display in insert mode
				enable_on_select = false, -- Enable diagnostics display in select mode

				-- Handle messages that exceed the window width
				overflow = {
					mode = "oneline", -- "wrap": split into lines, "none": no truncation, "oneline": keep single line
					padding = 0, -- Extra characters to trigger wrapping earlier
				},

				break_line = {
					enabled = false, -- Enable automatic line breaking
					-- after = 30, -- Number of characters before inserting a line break
				},

				format = nil, -- Custom function to format diagnostic messages

				virt_texts = {
					priority = 2048,
				},

				-- Remove severities you don't want to display
				severity = {
					vim.diagnostic.severity.ERROR,
					vim.diagnostic.severity.WARN,
					vim.diagnostic.severity.INFO,
					vim.diagnostic.severity.HINT,
				},

				overwrite_events = nil, -- Events that trigger attaching diagnostics to buffers

				override_open_float = true, -- Automatically disable diagnostics when opening diagnostic float windows
			},
		})
	end,
}
