return {
	"rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify")
		vim.notify("Hello Mike. Welcome to your Editor")
	end,
}
