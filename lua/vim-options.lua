vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- no cheating, direction arrows do not work here
vim.cmd("nnoremap <up> <nop>")
vim.cmd("nnoremap <down> <nop>")
vim.cmd("nnoremap <left> <nop>")
vim.cmd("nnoremap <right> <nop>")

-- relative line numbers and colors
vim.cmd("set rnu")
vim.api.nvim_set_hl(0, 'LineNr', { fg = "white"})
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = "white"})
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = "white"})
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = "white"})

-- shortcut mapleader - https://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
vim.g.mapleader = " "


