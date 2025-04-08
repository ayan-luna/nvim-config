return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			-- :h Telescope
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			-- vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
			-- vim.keymap.set("n", "<leader>fw", require("telescope").extensions.live_grep_args, { noremap = true })
			vim.keymap.set("n", "gr", builtin.lsp_references, {})
			vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		version = "*",
		config = function()
			require("telescope").load_extension("frecency")
			vim.keymap.set("n", "<leader>fr", ":Telescope frecency default_text=:CWD:<cr>", {})
		end,
	},
	{
		"nvim-telescope/telescope-live-grep-args.nvim",
		version = "*",
		config = function()
			require("telescope").load_extension("live_grep_args")
			vim.keymap.set(
				"n",
				"<leader>fw",
				require("telescope").extensions.live_grep_args.live_grep_args,
				{ noremap = true }
			)
		end,
	},
}
