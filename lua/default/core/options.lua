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
	tabstop = 2,
	numberwidth = 4,
	shiftwidth = 2,
	expandtab = true,
	softtabstop = 2,

	fillchars = { eob = " " },
	number = true,
	relativenumber = true,

	spell = true,
}

vim.cmd("set colorcolumn=80")

for option, value in pairs(options) do
	vim.opt[option] = value
end
