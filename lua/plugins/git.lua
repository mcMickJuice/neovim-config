return {
	{
		"tpope/vim-fugitive",
	},
	{ "tpope/vim-rhubarb" },
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
