local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local custom_fname = require("lualine.components.filename"):extend()
		local highlight = require("lualine.highlight")
		local default_status_colors = { saved = "#181826", modified = "#7f148e" }

		function custom_fname:init(options)
			custom_fname.super.init(self, options)
			self.status_colors = {
				saved = highlight.create_component_highlight_group(
					{ bg = default_status_colors.saved },
					"filename_status_saved",
					self.options
				),
				modified = highlight.create_component_highlight_group(
					{ bg = default_status_colors.modified },
					"filename_status_modified",
					self.options
				),
			}
			if self.options.color == nil then
				self.options.color = ""
			end
		end

		function custom_fname:update_status()
			local data = custom_fname.super.update_status(self)
			data = highlight.component_format_highlight(
				vim.bo.modified and self.status_colors.modified or self.status_colors.saved
			) .. data
			return data
		end

		lualine.setup({
			extensions = { "nvim-tree" },
			options = {
				theme = "auto",
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_a = {
					{ "mode" },
				},
				lualine_b = {
					{ "b:gitsigns_head", icon = "" },
					{ "diff", source = diff_source },
				},
				lualine_c = {
					{ custom_fname },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					{ "filetype" },
				},
				lualine_y = {
					{ "progress" },
				},
				lualine_z = {
					{ "location" },
				},
			},
		})
	end,
}
