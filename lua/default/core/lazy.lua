local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "default.plugins.coding-tools" },
	{ import = "default.plugins.coding-tools.cp" },
	{ import = "default.plugins.coding-tools.lsp" },
	{ import = "default.plugins.file-navigation" },
	{ import = "default.plugins.general" },
	{ import = "default.plugins.git" },
	{ import = "default.plugins.writing" },
}, {
	checker = {
		enable = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
