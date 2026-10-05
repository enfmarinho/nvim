local options = {
	backup = false,
	swapfile = false,
	undofile = true,
	showmode = false,
	mouse = "a",
	ignorecase = true,
	splitbelow = true,
	splitright = true,
	termguicolors = true,
	scrolloff = 31,

	autoindent = true,
	smartindent = true,
	smarttab = true,
	tabstop = 4,
	numberwidth = 4,
	shiftwidth = 4,
	expandtab = true,
	softtabstop = 4,

	fillchars = { eob = " " },
	number = true,
	relativenumber = true,

	spell = true,
}

for option, value in pairs(options) do
	vim.opt[option] = value
end

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
