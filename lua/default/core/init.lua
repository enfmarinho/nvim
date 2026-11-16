-- Silence vim.F.if_nil deprecation warning.
vim.F = vim.F or {}
---@diagnostic disable-next-line: duplicate-set-field
vim.F.if_nil = function(val, default)
	if val == nil then
		return default
	end
	return val
end

require("default.core.keymap")
require("default.core.lazy")
require("default.core.options")
