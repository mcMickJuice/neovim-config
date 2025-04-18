vim.cmd("set autoindent")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard^=unnamed,unnamedplus")

-- no cheating, direction arrows do not work here
vim.cmd("nnoremap <up> <nop>")
vim.cmd("nnoremap <down> <nop>")
vim.cmd("nnoremap <left> <nop>")
vim.cmd("nnoremap <right> <nop>")

-- hybrid line numbers (relative lines, with absolute on current line) and colors
vim.cmd("set nu rnu")
vim.cmd("set cursorline")
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "red" })
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "white" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "white" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "white" })

-- shortcut mapleader - https://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
vim.g.mapleader = " "

-- code folding via treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- disable auto folding, which is really annoying when it happens while coding - https://neovim.io/doc/user/fold.html
vim.opt.foldenable = false

-- hide default status bar https://www.reddit.com/r/neovim/comments/17dombf/how_to_entirely_remove_nvims_default_status_line/
vim.opt.cmdheight = 0

-- smartcase search when searching text
-- https://neovim.io/doc/user/usr_27.html#27.1
vim.cmd("set ignorecase smartcase")

-- auto close brackets, quotes etc
-- update 6/14/2024 - auto opening these characters got kinda annoying. Turning off for now
-- -- vim.cmd("inoremap [ []<left>")
-- vim.cmd("inoremap { {}<left>")
-- vim.cmd("inoremap {<CR> {<CR>}<ESC>O")

-- keymaps for quick list cprev and cnext. From teej video - https://www.youtube.com/watch?v=wOdL2T4hANk&ab_channel=TJDeVries
vim.keymap.set("n", "<C-h>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>cnext<CR>")

-- open diagnostic issue in float. Useful for typescript errors that are multilined
vim.keymap.set("n", "<leader>kd", function()
	vim.diagnostic.open_float()
end)
