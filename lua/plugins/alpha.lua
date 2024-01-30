return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    -- https://github.com/goolord/alpha-nvim
    local dashboard = require("alpha.themes.startify")

    alpha.setup(dashboard.opts)
  end,
}
