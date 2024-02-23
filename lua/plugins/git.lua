return {
  -- lets see what git-blame and gitsigns give me
  -- {
  -- 	"tpope/vim-fugitive",
  -- },
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
