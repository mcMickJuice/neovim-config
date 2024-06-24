return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- lualine docs - https://github.com/nvim-lualine/lualine.nvim
    -- show full filename in status bar - https://www.reddit.com/r/neovim/comments/16s1xky/comment/k27nf6g/
    local function filename()
      return "%F"
    end
    require("lualine").setup({
      options = {
        theme = "dracula",
      },
      sections = {
        lualine_c = { filename },
        lualine_x = { "filetype" },
      },
    })
  end,
}
