return {
	"moyiz/git-dev.nvim",
	enabled = false,
	event = "VeryLazy",
	keys = {
		{
			"<leader>er",
			function()
				local repository = vim.fn.input("Repository: ")
				if repository ~= "" then
					require("git-dev").open(repository)
				end
			end,
			desc = "Open a git repository",
		},
	},
	opts = {
		ephemeral = false,
		read_only = false,
		verbose = false,
		cd_type = "tab", -- Options: global|tab|window|none
		-- The actual `open` behavior.
		---@param dir string The path to the local repository.
		---@param repo_uri string The URI that was used to clone this repository.
		opener = function(dir, repo_uri)
			vim.print("Opening " .. repo_uri)
			vim.cmd("edit " .. vim.fn.fnameescape(dir))
		end,
		repositories_dir = vim.loop.os_homedir() .. "/Code/Clones/git-dev",
		git = {
			command = "git",
			default_org = nil,
			base_uri_format = "https://github.com/%s.git",
			clone_args = "--depth=1 --jobs=2 --no-tags --single-branch --recurse-submodules --shallow-submodules",
			fetch_args = "--depth=1 --jobs=2 --no-all --update-shallow -f --prune --no-tags",
		},
	},
}
