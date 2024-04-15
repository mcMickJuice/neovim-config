vim.cmd("set autoindent")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

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

-- auto close brackets, quotes etc
vim.cmd("inoremap [ []<left>")
vim.cmd("inoremap { {}<left>")
vim.cmd("inoremap {<CR> {<CR>}<ESC>O")

-- auto select current files directory
vim.cmd("set autochdir")
