return {
	{
		"tpope/vim-fugitive",
	},
	{
		"tpope/vim-rhubarb",
		config = function()
			vim.keymap.set("n", "<leader>gho", ":.GBrowse<CR>", {})
		end,
	},
	{
		"f-person/git-blame.nvim",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
		end,
	},
}
