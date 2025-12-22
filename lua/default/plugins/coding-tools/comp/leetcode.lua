local leetcode_arg = "leetcode.nvim"

return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	lazy = leetcode_arg ~= vim.fn.argv()[1],
	enabled = true,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.keymap.set("n", "<leader>lbm", "<cmd> Leet <cr>", { desc = "Open leet menu" })
		vim.keymap.set("n", "<leader>lbs", "<cmd> Leet submit <cr>", { desc = "Submit problem" })
		vim.keymap.set("n", "<leader>lbr", "<cmd> Leet run <cr>", { desc = "Run problem" })
		vim.keymap.set("n", "<leader>lbi", "<cmd> Leet info <cr>", { desc = "Problem information" })
		vim.keymap.set("n", "<leader>lbl", "<cmd> Leet list <cr>", { desc = "Open problem list" })
		vim.keymap.set("n", "<leader>lbd", "<cmd> Leet daily <cr>", { desc = "Open daily problem" })
		vim.keymap.set("n", "<leader>lbt", "<cmd> Leet tabs <cr>", { desc = "Open tabs menu" })
		vim.keymap.set("n", "<leader>lbc", "<cmd> Leet console <cr>", { desc = "Open console" })
		vim.keymap.set("n", "<leader>lbd", "<cmd> Leet desc <cr>", { desc = "Open problem description" })
		vim.keymap.set("n", "<leader>lbo", "<cmd> Leet open <cr>", { desc = "Open problem on browser" })
	end,
	opts = {
		arg = leetcode_arg,
		lang = "cpp",
		storage_home = vim.fn.stdpath("data") .. "/leetcode/",
		logging = true,
		injector = {
			["cpp"] = {
				before = { "#include <vector>", "#include <string>", "using namespace std;" },
				after = { "int main() {", "Solution s;", "}" },
			},
		},
		cache = {
			update_interval = 60 * 60 * 24 * 7,
		},
		console = {
			open_on_runcode = true,
			dir = "row",
			size = {
				width = "90%",
				height = "75%",
			},
			result = {
				size = "60%",
			},
			testcase = {
				virt_text = true,
				size = "40%",
			},
		},
		description = {
			position = "left",
			width = "40%",
			show_stats = true,
		},
		hooks = {
			LeetEnter = {},
			LeetQuestionNew = {},
		},
		keys = {
			toggle = { "q", "<Esc>" },
			confirm = { "<CR>" },
			reset_testcases = "r",
			use_testcase = "U",
			focus_testcases = "H",
			focus_result = "L",
		},
		image_support = false, -- setting this to `true` will disable question description wrap
	},
}
