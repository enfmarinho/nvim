local opts = { noremap = true, silent = true }

opts.desc = "Smart rename"
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

opts.desc = "See available fixes"
vim.keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.code_action, opts)

opts.desc = "Go to declaration"
vim.keymap.set("n", "<leader>lg", vim.lsp.buf.declaration, opts)

opts.desc = "Show buffer diagnostics"
vim.keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

opts.desc = "Show line diagnostics"
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

opts.desc = "Go to previous diagnostic"
vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)

opts.desc = "Go to next diagnostic"
vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)

opts.desc = "Show documentation for what is under cursor"
vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, opts)

opts.desc = "Show LSP references and definitions"
vim.keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts)

opts.desc = "Show LSP implementations"
vim.keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)

opts.desc = "Show LSP type definitions"
vim.keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

opts.desc = "Open cargo.toml"
vim.keymap.set("n", "<leader>co", "<cmd> RustLsp openCargo <cr>", opts)

opts.desc = "Expand macro recursively"
vim.keymap.set("n", "<leader>le", "<cmd> RustLsp expandMacro <cr>", opts)

opts.desc = "Go to parent module"
vim.keymap.set("n", "<leader>lm", "<cmd> RustLsp parentModule <cr>", opts)

opts.desc = "Format"
vim.keymap.set("n", "<leader>lF", "<cmd> RustFmt <cr>", opts)
