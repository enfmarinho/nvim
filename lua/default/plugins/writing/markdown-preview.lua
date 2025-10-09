return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown" },
	event = "VeryLazy",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	enabled = true,
	build = "cd app && yarn install",
	config = function()
		vim.keymap.set("n", "<leader>pm", "<cmd> MarkdownPreview <cr>", { desc = "Preview markdown" })
	end,
}
