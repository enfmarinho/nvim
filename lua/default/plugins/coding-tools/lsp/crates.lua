local function show_documentation()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end

return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	enabled = true,
	tag = "stable",
	config = function()
		local crates = require("crates")
		crates.setup({})

		vim.keymap.set("n", "<leader>ct", crates.toggle, { silent = true, desc = "Toggle crates" })
		vim.keymap.set("n", "<leader>cr", crates.reload, { silent = true, desc = "Reload crates" })
		vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { silent = true, desc = "Show crates version" })
		vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { silent = true, desc = "Show crates features" })
		vim.keymap.set(
			"n",
			"<leader>cd",
			crates.show_dependencies_popup,
			{ silent = true, desc = "Show crates dependencies" }
		)
		vim.keymap.set("n", "<leader>cu", crates.update_crate, { silent = true, desc = "Update crate" })
		vim.keymap.set("v", "<leader>cu", crates.update_crates, { silent = true, desc = "Update crates" })
		vim.keymap.set("n", "<leader>ca", crates.update_all_crates, { silent = true, desc = "Updates all crates" })
		vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, { silent = true, desc = "Upgrade crate" })
		vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, { silent = true, desc = "Upgrade crates" })
		vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, { silent = true, desc = "Upgrade all crates" })
		vim.keymap.set(
			"n",
			"<leader>cx",
			crates.expand_plain_crate_to_inline_table,
			{ silent = true, desc = "Expand crate" }
		)
		vim.keymap.set("n", "<leader>cX", crates.extract_crate_into_table, { silent = true, desc = "Extract crate" })
		vim.keymap.set("n", "<leader>ck", show_documentation, { silent = true, desc = "Show crate documentation" })
		vim.keymap.set(
			"n",
			"<leader>cK",
			crates.open_documentation,
			{ silent = true, desc = "Open crate documentation" }
		)
		vim.keymap.set("n", "<leader>cH", crates.open_homepage, { silent = true, desc = "Open crate homepage" })
		vim.keymap.set("n", "<leader>cC", crates.open_crates_io, { silent = true, desc = "Open crate.io" })
		vim.keymap.set("n", "<leader>cR", crates.open_repository, { silent = true, desc = "Open crate repository" })
	end,
}
